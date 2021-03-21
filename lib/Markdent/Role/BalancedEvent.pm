package Markdent::Role::BalancedEvent;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.40';

use List::AllUtils qw( all );
use Markdent::Types;
use Params::ValidationCompiler qw( validation_for );
use Specio::Declare;

use MooseX::Role::Parameterized;

parameter compare => (
    isa => t( 'ArrayRef', of => t('Str') ),
);

role {
    my $p = shift;

    my @compare = @{ $p->compare || [] };

    my $validator = validation_for(
        params => [
            { type => t('EventObject') },
        ],
    );

    method balances_event => sub {
        my $self = shift;
        my ($other) = $validator->(@_);

        return 0 unless $self->name eq $other->name;

        return 0
            unless ( $self->is_start && $other->is_end )
            || ( $self->is_end && $other->is_start );

        return 1 unless @compare;

        return all { $self->$_() eq $other->$_() } @compare;
    };
};

1;

# ABSTRACT: A parameterized role for events which can check if they balance another event

__END__

=pod

=head1 DESCRIPTION

This role provides behavior for start and end events which can be checked for a
balancing event. This includes things like strong, emphasis, and code start/end
events.

=head1 ROLE PARAMETERS

This role accepts the following parameters:

=over 4

=item * compare => [ ... ]

This should be a list of attribute names which will be compared between the
start and end events.

=back

=head1 METHODS

This role provides the following methods:

=head2 $event->balances_event($event2)

Given an event, this returns true if two events balance each other. This is
done by comparing types (StartCode matches EndCode), as well as the attributes
provided in the compare parameter.

=head1 BUGS

See L<Markdent> for bug reporting details.

=cut
