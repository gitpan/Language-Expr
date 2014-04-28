use 5.006;
use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.040

use Test::More  tests => 11 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'Language/Expr.pm',
    'Language/Expr/Compiler/Base.pm',
    'Language/Expr/Compiler/JS.pm',
    'Language/Expr/Compiler/PHP.pm',
    'Language/Expr/Compiler/Perl.pm',
    'Language/Expr/Evaluator.pm',
    'Language/Expr/EvaluatorRole.pm',
    'Language/Expr/Interpreter/Default.pm',
    'Language/Expr/Interpreter/Dummy.pm',
    'Language/Expr/Interpreter/VarEnumer.pm',
    'Language/Expr/Parser.pm'
);



# no fake home requested

my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


