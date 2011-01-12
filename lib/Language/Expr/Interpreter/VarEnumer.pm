package Language::Expr::Interpreter::VarEnumer;
BEGIN {
  $Language::Expr::Interpreter::VarEnumer::VERSION = '0.17';
}
# ABSTRACT: Enumerate variables mentioned in Language::Expr expression

use Any::Moose;
with 'Language::Expr::EvaluatorRole';
extends 'Language::Expr::Evaluator';


has result => (is => 'rw');



sub add_var {
    my ($self, $v) = @_;
    push @{$self->result}, $v unless $v ~~ @{$self->result};
}

sub rule_pair_simple { }

sub rule_pair_string { }

sub rule_or_xor { }

sub rule_ternary { }

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

sub rule_dquotestr {
    my ($self, %args) = @_;
    my $match = $args{match};

    for (@{ $match->{part} }) {
        # extract 'foo' from '${foo}'
        if (substr($_, 0, 2) eq '${') {
            $self->add_var(substr($_, 2, length()-3));
        # extract 'foo' from '$foo'
        } elsif (substr($_, 0, 1) eq '$') {
            $self->add_var(substr($_, 1, length()-1));
        }
    }
}

sub rule_bool { }

sub rule_num { }

sub rule_var {
    my ($self, %args) = @_;
    my $match = $args{match};
    $self->add_var($match->{var});
}

sub rule_func { }

sub rule_func_map {
}

sub rule_func_grep {
}

sub rule_func_usort {
}

sub rule_parenthesis {}

sub expr_preprocess {
    my ($self, %args) = @_;
    $self->result([]);
}

sub expr_postprocess {}

sub eval {
    my ($self, $expr) = @_;
    my $res = Language::Expr::Parser::parse_expr($expr, $self);
    $self->result;
}


__PACKAGE__->meta->make_immutable;
no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::Interpreter::VarEnumer - Enumerate variables mentioned in Language::Expr expression

=head1 VERSION

version 0.17

=head1 ATTRIBUTES

=head2 result => ARRAYREF

Store the list of variables seen during parsing.

=head1 METHODS

=for Pod::Coverage ^(rule|expr)_.+

=head2 add_var(VAR)

Add variable to B<result> if it is not already in there.

=head1 BUGS/TODOS

Currently $_ in map/grep variables and $a & $b in usort are counted.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

