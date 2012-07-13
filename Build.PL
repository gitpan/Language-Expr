
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Data::Clone" => 0,
    "Data::Rmap" => 0,
    "File::Which" => 0,
    "Module::Build" => "0.3601",
    "String::ShellQuote" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Simple minilanguage for use in expression",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Language-Expr",
  "dist_version" => "0.19",
  "license" => "perl",
  "module_name" => "Language::Expr",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "JSON" => 0,
    "List::MoreUtils" => 0,
    "Moo" => 0,
    "Regexp::Grammars" => "1.005",
    "UUID::Tiny" => 0,
    "boolean" => "0.20",
    "perl" => "5.010000"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
