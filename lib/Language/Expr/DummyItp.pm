package Language::Expr::DummyItp;
BEGIN {
  $Language::Expr::DummyItp::VERSION = '0.03';
}
# Dummy interpreter for Language::Expr (used for testing)

use Any::Moose;
with 'Language::Expr::InterpreterRole';

require Language::Expr::Parser;


sub rule_pair { }
sub rule_or_xor { }
sub rule_and { }
sub rule_bit_or_xor { }
sub rule_bit_and { }
sub rule_equal { }
sub rule_less_greater { }
sub rule_bit_shift { }
sub rule_add { }
sub rule_mult { }
sub rule_unary { }
sub rule_power { }
sub rule_subscripting { }
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
sub rule_preprocess { }
sub rule_postprocess { }

__PACKAGE__->meta->make_immutable;
no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::DummyItp

=head1 VERSION

version 0.03

=head1 DESCRIPTION

This interpreter does nothing. It is used only for testing the parser.

=head1 ATTRIBUTES

=head2 METHODS

=for Pod::Coverage ^rule_.+

=head1 AUTHOR

  Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

