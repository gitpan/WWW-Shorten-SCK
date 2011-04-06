#!perl
#
# This file is part of WWW-Shorten-SCK
#
# This software is copyright (c) 2011 by Celogeek.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#

BEGIN {
    unless ( $ENV{RELEASE_TESTING} ) {
        require Test::More;
        Test::More::plan(
            skip_all => 'these tests are for release candidate testing' );
    }
}

use Test::More;

eval "use Pod::Wordlist::hanekomu";
plan skip_all => "Pod::Wordlist::hanekomu required for testing POD spelling"
    if $@;

eval "use Test::Spelling";
plan skip_all => "Test::Spelling required for testing POD spelling"
    if $@;

add_stopwords(<DATA>);
all_pod_files_spelling_ok('lib');
__DATA__
Celogeek
SCK
sck
makealongerlink
makeashorterlink
