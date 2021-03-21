package Markdent::Simple::Fragment;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.41';

use Markdent::Handler::HTMLStream::Fragment;
use Markdent::Parser;
use Markdent::Types;
use Params::ValidationCompiler qw( validation_for );
use Specio::Declare;

use Moose;
use MooseX::StrictConstructor;

with 'Markdent::Role::Simple';

{
    my $validator = validation_for(
        params => [
            dialects => {
                type => union(
                    of => [
                        t('Str'),
                        t( 'ArrayRef', of => t('Str') )
                    ]
                ),
                default => sub { [] },
            },
            markdown => { type => t('Str') },
        ],
        named_to_list => 1,
    );

    sub markdown_to_html {
        my $self = shift;
        my ( $dialects, $markdown ) = $validator->(@_);

        my $handler_class = 'Markdent::Handler::HTMLStream::Fragment';

        return $self->_parse_markdown(
            $markdown,
            $dialects,
            $handler_class,
        );
    }
}

__PACKAGE__->meta->make_immutable;

1;

# ABSTRACT: Convert Markdown to an HTML Fragment

__END__

=pod

=head1 SYNOPSIS

    use Markdent::Simple::Fragment;

    my $mds  = Markdent::Simple::Fragment->new;
    my $html = $mds->markdown_to_html(
        markdown => $markdown,
    );

=head1 DESCRIPTION

This class provides a very simple interface for converting Markdown to an HTML
fragment.

=head1 METHODS

This class provides the following methods:

=head2 Markdent::Simple::Fragment->new

Creates a new Markdent::Simple::Fragment object.

=head2 $mdf->markdown_to_html( markdown => $markdown )

This method turns Markdown into HTML. It accepts the following parameters:

=over 4

=item * markdown

This is the markdown to pass. This argument is required.

=item * dialects

This can either be a single string or an array ref of strings containing the
class names of dialects. This parameter is optional.

=back

=head1 ROLES

This class does the L<Markdent::Role::Simple> role.

=head1 BUGS

See L<Markdent> for bug reporting details.

=cut
