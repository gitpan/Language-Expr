#!perl -T

use Test::More tests => 2;

BEGIN {
	use_ok( 'Language::Expr' );
	use_ok( 'Language::Expr::Parser' );
}

diag( "Testing Language::Expr $Language::Expr::VERSION, Perl $], $^X" );
