package Language::Expr::Interpreter::Dummy;
BEGIN {
  $Language::Expr::Interpreter::Dummy::VERSION = '0.15';
}
# ABSTRACT: Dummy interpreter for Language::Expr (used for testing)

use Any::Moose;
with 'Language::Expr::EvaluatorRole';
extends 'Language::Expr::Evaluator';


sub rule_pair_simple { }
sub rule_pair_string { }
sub rule_or_xor { }
sub rule_and { }
sub rule_bit_or_xor { }
sub rule_bit_and { }
sub rule_comparison3 { }
sub rule_comparison { }
sub rule_bit_shift { }
sub rule_add { }
sub rule_mult { }
sub rule_unary { }
sub rule_power { }
sub rule_subscripting_var { }
sub rule_subscripting_expr { }
sub rule_array { }
sub rule_hash { }
sub rule_undef { }
sub rule_squotestr { }
sub rule_dquotestr { }
sub rule_bool { }
sub rule_num { }
sub rule_var { }
sub rule_func { }
sub rule_func_map { }
sub rule_func_grep { }
sub rule_func_usort { }
sub rule_parenthesis { }
sub expr_preprocess { }
sub expr_postprocess { }

__PACKAGE__->meta->make_immutable;
no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::Interpreter::Dummy - Dummy interpreter for Language::Expr (used for testing)

=head1 VERSION

version 0.15

=head1 DESCRIPTION

This interpreter does nothing. It is used only for testing the parser.

=head1 ATTRIBUTES

=head1 METHODS

=for Pod::Coverage ^(rule|expr)_.+

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

