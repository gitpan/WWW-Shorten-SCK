#
# This file is part of WWW-Shorten-SCK
#
# This software is copyright (c) 2011 by celogeek <me@celogeek.com>.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package WWW::Shorten::SCK;
use strict;
use warnings;
our $VERSION = '0.3';    # VERSION

# ABSTRACT: Perl interface to sck.to

use 5.006;

use parent qw( WWW::Shorten::generic Exporter );
use vars qw(@EXPORT_OK %EXPORT_TAGS);
@EXPORT_OK = qw( makeashorterlink makealongerlink );
%EXPORT_TAGS = ( all => [@EXPORT_OK] );

use Carp;

sub makeashorterlink {
    my $url     = shift or croak 'No URL passed to makeashorterlink';
    my $ua      = __PACKAGE__->ua();
    my $sck_url = 'http://sck.to';
    my $resp    = $ua->post(
        $sck_url,
        [   a   => 1,
            url => $url,
        ]
    );
    return unless $resp->is_success;
    my $content = $resp->content;
    if ( $content =~ qr{\Qhttp://sck.to/\E}x ) {
        return $content;
    }
    return;
}

sub makealongerlink {
    my $sck_url = shift
        or croak 'No SCK key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    #call api to get long url from the short
    $sck_url = "http://sck.to/$sck_url"
        unless $sck_url =~ m!^http://!ix;

    #short should contain sck.to
    return unless $sck_url =~ qr{\Qhttp://sck.to/\E}x;

    my $resp = $ua->get( $sck_url . "?a=1" );

    return unless $resp->is_success;
    return $resp->content;
}

1;

__END__

=pod

=head1 NAME

WWW::Shorten::SCK - Perl interface to sck.to

=head1 VERSION

version 0.3

=head1 SYNOPSIS

    use WWW::Shorten 'SCK';

    my $long_url = "a long url";
    my $short_url = "";
    $short_url = makeashorterlink($long_url);
    $long_url = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web sck.to. SCK keep a database of long URLs,
and give you a tiny one.

=head1 METHODS

=head2 makeashorterlink

The function C<makeashorterlink> will call the SCK web site passing
it your long URL and will return the shorter SCK version.

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full SCK URL or just the
SCK identifier.

If anything goes wrong, then either function will return nothing.

=head1 SUPPORT, LICENSE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://sck.to/>

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
http://tasks.celogeek.com/projects/perl-modules-www-shorten-sck

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

celogeek <me@celogeek.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by celogeek <me@celogeek.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
