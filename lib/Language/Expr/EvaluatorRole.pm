package Language::Expr::EvaluatorRole;
BEGIN {
  $Language::Expr::EvaluatorRole::VERSION = '0.04';
}
# ABSTRACT: Specification for Language::Expr interpreter/compiler

use Any::Moose '::Role';

requires 'rule_pair';
requires 'rule_or_xor';
requires 'rule_and';
requires 'rule_bit_or_xor';
requires 'rule_bit_and';
requires 'rule_comparison3';
requires 'rule_comparison';
requires 'rule_bit_shift';
requires 'rule_add';
requires 'rule_mult';
requires 'rule_unary';
requires 'rule_power';
requires 'rule_subscripting';
requires 'rule_array';
requires 'rule_hash';
requires 'rule_undef';
requires 'rule_squotestr';
requires 'rule_dquotestr';
requires 'rule_var';
requires 'rule_func';
requires 'rule_func_map';
requires 'rule_func_grep';
requires 'rule_func_usort';
requires 'rule_bool';
requires 'rule_num';
requires 'rule_parenthesis';
requires 'expr_preprocess';
requires 'expr_postprocess';

no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::EvaluatorRole - Specification for Language::Expr interpreter/compiler

=head1 VERSION

version 0.04

=head1 AUTHOR

  Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

