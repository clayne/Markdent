# NAME

Markdent - An event-based Markdown parser toolkit

# VERSION

version 0.40

# SYNOPSIS

    use Markdent::Simple::Document;

    my $parser = Markdent::Simple::Document->new;
    my $html   = $parser->markdown_to_html(
        title    => 'My Document',
        markdown => $markdown,
    );

# DESCRIPTION

This distribution provides a toolkit for parsing Markdown (and Markdown
variants, aka dialects). Unlike the other Markdown Perl tools, this module can
be used for more than just generating HTML. The core parser generates events
(like XML's SAX), making it easy to analyze a Markdown document in any number
of ways.

If you're only interested in converting Markdown to HTML, you can use the
[Markdent::Simple::Document](https://metacpan.org/pod/Markdent%3A%3ASimple%3A%3ADocument) class to do this, although you can just as well
use better battle-tested tools like [Text::Markdown](https://metacpan.org/pod/Text%3A%3AMarkdown).

See [Markdent::Manual](https://metacpan.org/pod/Markdent%3A%3AManual) for more details on how Markdent works and how you can
use it.

# QUICK MARKDOWN TO HTML CONVERSION

If you just want to do some quick Markdown to HTML conversion use either the
[Markdent::Simple::Document](https://metacpan.org/pod/Markdent%3A%3ASimple%3A%3ADocument) or [Markdent::Simple::Fragment](https://metacpan.org/pod/Markdent%3A%3ASimple%3A%3AFragment) class.

This distribution also ships with a command line tool called [markdent-html](https://metacpan.org/pod/markdent-html).
See that tool's documentation for details on how to use it.

# PROCESSING PIPELINES

If you want to create a Markdown processing pipeline, start by looking at the
various handler classes:

- [Markdent::Handler::HTMLStream::Document](https://metacpan.org/pod/Markdent%3A%3AHandler%3A%3AHTMLStream%3A%3ADocument)
- [Markdent::Handler::HTMLStream::Fragment](https://metacpan.org/pod/Markdent%3A%3AHandler%3A%3AHTMLStream%3A%3AFragment)
- [Markdent::Handler::HTMLStream::Multiplexer](https://metacpan.org/pod/Markdent%3A%3AHandler%3A%3AHTMLStream%3A%3AMultiplexer)
- [Markdent::Handler::HTMLStream::HTMLFilter](https://metacpan.org/pod/Markdent%3A%3AHandler%3A%3AHTMLStream%3A%3AHTMLFilter)
- [Markdent::Handler::HTMLStream::CaptureEvents](https://metacpan.org/pod/Markdent%3A%3AHandler%3A%3AHTMLStream%3A%3ACaptureEvents)

You will probably also want to write your own handler class as part of the
pipeline. This will need to implement the [Markdent::Role::Handler](https://metacpan.org/pod/Markdent%3A%3ARole%3A%3AHandler) role.

To do that you'll need to review the many `Markdent::Event::*` classes. Each
event represents something seen by the parse, such as a piece of the start or
end of a piece of block (paragraph, header) or span markup (strong, link) or
some text.

The start of a pipeline will generally be either the [Markdent::Parser](https://metacpan.org/pod/Markdent%3A%3AParser) or
[Markdent::CapturedEvents](https://metacpan.org/pod/Markdent%3A%3ACapturedEvents) class.

# CUSTOM DIALECTS

You may also want to implement a custom dialect to add some additional features
to the parser. Your parser classes will need to consume either the
[Markdent::Role::Dialect::BlockParser](https://metacpan.org/pod/Markdent%3A%3ARole%3A%3ADialect%3A%3ABlockParser) or the
[Markdent::Role::Dialect::SpanParser](https://metacpan.org/pod/Markdent%3A%3ARole%3A%3ADialect%3A%3ASpanParser) role. The best way to understand how a
dialect is implemented is to look at one of the existing dialect classes:

- [Markdent::Dialect::GitHub::BlockParser](https://metacpan.org/pod/Markdent%3A%3ADialect%3A%3AGitHub%3A%3ABlockParser)
- [Markdent::Dialect::GitHub::SpanParser](https://metacpan.org/pod/Markdent%3A%3ADialect%3A%3AGitHub%3A%3ASpanParser)
- [Markdent::Dialect::Theory::BlockParser](https://metacpan.org/pod/Markdent%3A%3ADialect%3A%3ATheory%3A%3ABlockParser)
- [Markdent::Dialect::Theory::SpanParser](https://metacpan.org/pod/Markdent%3A%3ADialect%3A%3ATheory%3A%3ASpanParser)

You'll also need to dig into the core [Markdent::Parser::BlockParser](https://metacpan.org/pod/Markdent%3A%3AParser%3A%3ABlockParser) and
[Markdent::Parser::SpanParser](https://metacpan.org/pod/Markdent%3A%3AParser%3A%3ASpanParser) classes in order to see how these dialects
interact with the core parser.

# DONATIONS

If you'd like to thank me for the work I've done on this module, please
consider making a "donation" to me via PayPal. I spend a lot of free time
creating free software, and would appreciate any support you'd care to offer.

Please note that **I am not suggesting that you must do this** in order for me
to continue working on this particular software. I will continue to do so,
inasmuch as I have in the past, for as long as it interests me.

Similarly, a donation made in this way will probably not make me work on this
software much more, unless I get so many donations that I can consider working
on free software full time, which seems unlikely at best.

To donate, log into PayPal and send money to autarch@urth.org or use the button
on this page: [http://www.urth.org/~autarch/fs-donation.html](http://www.urth.org/~autarch/fs-donation.html)

# BUGS

Please report any bugs or feature requests to `bug-markdent@rt.cpan.org`, or
through the web interface at [http://rt.cpan.org](http://rt.cpan.org).  I will be notified, and
then you'll automatically be notified of progress on your bug as I make
changes.

Bugs may be submitted at [https://github.com/houseabsolute/Markdent/issues](https://github.com/houseabsolute/Markdent/issues).

I am also usually active on IRC as 'autarch' on `irc://irc.perl.org`.

# SOURCE

The source code repository for Markdent can be found at [https://github.com/houseabsolute/Markdent](https://github.com/houseabsolute/Markdent).

# DONATIONS

If you'd like to thank me for the work I've done on this module, please
consider making a "donation" to me via PayPal. I spend a lot of free time
creating free software, and would appreciate any support you'd care to offer.

Please note that **I am not suggesting that you must do this** in order for me
to continue working on this particular software. I will continue to do so,
inasmuch as I have in the past, for as long as it interests me.

Similarly, a donation made in this way will probably not make me work on this
software much more, unless I get so many donations that I can consider working
on free software full time (let's all have a chuckle at that together).

To donate, log into PayPal and send money to autarch@urth.org, or use the
button at [https://www.urth.org/fs-donation.html](https://www.urth.org/fs-donation.html).

# AUTHOR

Dave Rolsky <autarch@urth.org>

# CONTRIBUTORS

- Andrew Speer <andrew.speer@isolutions.com.au>
- Denis Ibaev <dionys@gmail.com>
- Jason McIntosh <jmac@appleseed-sc.com>
- Jonas Smedegaard <dr@jones.dk>
- Konrad Bucheli <konrad.bucheli@gmx.ch>
- Polina Shubina <925043@mai.com>
- Shlomi Fish <shlomif@shlomifish.org>
- Stefan Hornburg (Racke) <racke@linuxia.de>
- Tom Hukins <tom@eborcom.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Dave Rolsky.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the
`LICENSE` file included with this distribution.
