package Language::Expr::Evaluator;
# ABSTRACT: Base class for Language::Expr compilers and interpreters

our $VERSION = '0.22'; # VERSION

use 5.010;
use strict;
use warnings;

use Moo;
require Language::Expr::Parser;


sub eval {
    my ($self, $expr) = @_;
    my $res = Language::Expr::Parser::parse_expr($expr, $self);
    $res;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Language::Expr::Evaluator - Base class for Language::Expr compilers and interpreters

=head1 VERSION

This document describes version 0.22 of module Language::Expr::Evaluator (in distribution Language-Expr), released on 2014-04-28.

=head1 METHODS

=head2 eval($expr) => $result

Evaluate expression and return the result.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Language-Expr>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Language-Expr>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Language-Expr>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
