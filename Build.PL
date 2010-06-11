
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Simple minilanguage for use in expression',
  'dist_author' => [
    'Steven Haryanto <stevenharyanto@gmail.com>'
  ],
  'dist_name' => 'Language-Expr',
  'dist_version' => '0.03',
  'license' => 'perl',
  'module_name' => 'Language::Expr',
  'recommends' => {},
  'requires' => {
    'Any::Moose' => '0',
    'Mouse' => '0',
    'Regexp::Grammars' => '0',
    'perl' => '5.010000'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
