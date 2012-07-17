
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Scalar::Util" => 0,
    "Test::More" => "0.94",
    "WWW::Shorten" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Perl interface to sck.to",
  "dist_author" => [
    "celogeek <me\@celogeek.com>"
  ],
  "dist_name" => "WWW-Shorten-SCK",
  "dist_version" => "0.2",
  "license" => "perl",
  "module_name" => "WWW::Shorten::SCK",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Exporter" => 0,
    "WWW::Shorten::generic" => 0,
    "parent" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
