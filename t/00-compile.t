use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.018

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
Language/Expr.pm
Language/Expr/Compiler/Base.pm
Language/Expr/Compiler/JS.pm
Language/Expr/Compiler/PHP.pm
Language/Expr/Compiler/Perl.pm
Language/Expr/Evaluator.pm
Language/Expr/EvaluatorRole.pm
Language/Expr/Interpreter/Default.pm
Language/Expr/Interpreter/Dummy.pm
Language/Expr/Interpreter/VarEnumer.pm
Language/Expr/Parser.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require q[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;
