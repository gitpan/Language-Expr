package Language::Expr::VarEnumer;
BEGIN {
  $Language::Expr::VarEnumer::VERSION = '0.03';
}
# Enumerate variables mentioned in Language::Expr expression

use Any::Moose;
with 'Language::Expr::InterpreterRole';

require Language::Expr::Parser;


has result => (is => 'rw');



sub add_var {
    my ($self, $v) = @_;
    push @{$self->result}, $v unless $v ~~ @{$self->result};
}

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

sub rule_dquotestr {
    my ($self, %args) = @_;
    my $match = $args{match};

    for (@{ $match->{part} }) {
        if    (/^\$(\w+)$/)    { $self->add_var($1) }
        elsif (/^\$\((.+)\)$/) { $self->add_var($1) }
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
    die "Subexpression not yet supported";
}

sub rule_func_grep {
    die "Subexpression not yet supported";
}

sub rule_func_usort {
    die "Subexpression not yet supported";
}

sub rule_preprocess {
    my ($self, %args) = @_;
    $self->result([]);
}

sub rule_postprocess {
}

__PACKAGE__->meta->make_immutable;
no Any::Moose;
1;

__END__
=pod

=head1 NAME

Language::Expr::VarEnumer

=head1 VERSION

version 0.03

=head1 ATTRIBUTES

=head2 result => ARRAYREF

Store the list of variables seen during parsing.

=head2 METHODS

=for Pod::Coverage ^rule_.+

=head2 add_var(VAR)

Add variable to B<result> if it is not already in there.

=head1 AUTHOR

  Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

