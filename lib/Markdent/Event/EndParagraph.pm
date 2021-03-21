package Markdent::Event::EndParagraph;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.41';

use Moose;
use MooseX::StrictConstructor;

with 'Markdent::Role::Event' => { event_class => __PACKAGE__ };

__PACKAGE__->meta->make_immutable;

1;

# ABSTRACT: An event for the end of a paragraph

__END__

=pod

=head1 DESCRIPTION

This class represents the end of a paragraph.

=head1 ROLES

This class does the L<Markdent::Role::Event> role.

=head1 BUGS

See L<Markdent> for bug reporting details.

=cut
