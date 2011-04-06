
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Scalar::Util' => '0',
    'Test::More' => '0.94',
    'WWW::Shorten' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'WWW::Shorten::SCK - Perl interface to sck.to',
  'dist_author' => [
    'Celogeek <geistteufel@yahoo.fr>'
  ],
  'dist_name' => 'WWW-Shorten-SCK',
  'dist_version' => '0.001',
  'license' => 'perl',
  'module_name' => 'WWW::Shorten::SCK',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Exporter' => '0',
    'WWW::Shorten::generic' => '0',
    'perl' => '5.008'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
