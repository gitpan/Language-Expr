
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
                       'dist_abstract' => 'Simple minilanguage for use in expression',
                       'script_files' => [],
                       'license' => 'perl',
                       'build_requires' => {
                                             'Module::Build' => '0.3601'
                                           },
                       'dist_name' => 'Language-Expr',
                       'dist_author' => [
                                          'Steven Haryanto <stevenharyanto@gmail.com>'
                                        ],
                       'module_name' => 'Language::Expr',
                       'requires' => {
                                       'perl' => '5.010000',
                                       'Any::Moose' => '0',
                                       'Mouse' => '0',
                                       'Regexp::Grammars' => '0'
                                     },
                       'recommends' => {},
                       'configure_requires' => {
                                                 'Module::Build' => '0.3601'
                                               },
                       'dist_version' => '0.01'
                     );


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
