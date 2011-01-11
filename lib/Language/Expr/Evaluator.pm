package Language::Expr::Evaluator;
BEGIN {
  $Language::Expr::Evaluator::VERSION = '0.15';
}
# ABSTRACT: Base class for Language::Expr compilers and interpreters

use Any::Moose;
require Language::Expr::Parser;


sub eval {
    my ($self, $expr) = @_;
    my $res = Language::Expr::Parser::parse_expr($expr, $self);
    $res;
}

__PACKAGE__->meta->make_immutable;
no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::Evaluator - Base class for Language::Expr compilers and interpreters

=head1 VERSION

version 0.15

=head1 METHODS

=head2 eval($expr) => $result

Evaluate expression and return the result.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

