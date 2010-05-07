package Language::Expr;
BEGIN {
  $Language::Expr::VERSION = '0.01';
}
# ABSTRACT: Simple minilanguage for use in expression


use Any::Moose;
use Language::Expr::Parser;
use Language::Expr::Interpreter;



has interpreter => (is => 'ro', default => sub { Language::Expr::Interpreter->new });



sub var {
    my ($self, %args) = @_;
    my $itp = $self->interpreter;
    $itp->vars->{$_} = $args{$_} for keys %args;
}


sub func {
    my ($self, %args) = @_;
    my $itp = $self->interpreter;
    for (keys %args) {
        die "Function `$_` already defined" if $itp->funcs->{$_};
        die "Function `$_`: coderef required" unless ref($args{$_}) eq 'CODE';
        $itp->funcs->{$_} = $args{$_};
    }
}


sub eval {
    my ($self, $str) = @_;
    my $itp = $self->interpreter;
    Language::Expr::Parser::parse_expr($str, $itp);
}



1;

__END__
=pod

=head1 NAME

Language::Expr - Simple minilanguage for use in expression

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    use Language::Expr;
    my $le = new Language::Expr;
    $le->var('a' => 1, 'b' => 2);
    $le->func(sqr => sub { $_[0] ** 2 }, rand => sub {rand()});
    say $le->eval('$a + sqr($b)'); # 5

=head1 DESCRIPTION

Language::Expr defines a simple, Perl-like expression minilanguage. It
supports mathematical and string operators, arrays, hashes, variables,
and functions. See L<Language::Expr::Manual::Syntax> for description
of the language syntax.

The language is very simple. The parser is just around 120 lines
long. There is no predefined variables or functions or even many of
the semantics.

This distribution consists of the language parser
(L<Language::Expr::Parser>) and the interpreter
(L<Language::Expr::Interpreter>).

The parser is used by other modules such as L<Data::Template::Expr>
and L<Data::Schema>, to provide support for expressions. In the latter
case, the expressions are converted into Perl, PHP, and JavaScript.

=head1 ATTRIBUTES

=head2 interpreter

The Language::Expr::Interpreter instance.

=head1 METHODS

=head2 new()

Construct a new Language::Expr object.

=head2 var(NAME => VALUE, ...)

Define variables.

=head2 func(NAME => CODEREF, ...)

Define functions. Dies if function is defined multiple times.

=head2 eval(STR) => RESULT

Evaluate expression in STR and return the result. Will die if there is
a parsing or runtime error.

=head1 FAQ

=head2 Why yet another simplistic (restricted, etc) language? Why not just Perl?

When first adding expression support to L<Data::Schema>, I want a
language that is simple enough so I can easily convert it to Perl,
PHP, JavaScript, and others. I do not need a fully-fledged programming
language (in fact, Expr is not even Turing-complete, it does not
support assignment or loops). Instead, I just need some basic stuffs
like mathematical/string/logical operators, arrays, hashes, and
functions. This language will mostly be used inside templates and
schemas.

=head2 Why don't you use Language::Farnsworth, or Math::Expression, or Math::Expression::Evaluator, or $FOO?

I need a parser separate from the interpreter, because in different
applications I need a different set of functions and different
semantics. In Data::Schema, I also need to use the parser to emit code
for other languages.

The language is simple enough that it's much easier to just create my
own parser instead of trying to fit the abovementioned modules for my
needs.

=head2 I want different syntax for (variables, foo operator, etc)!

Create your own language :-) Fork this distribution and start
modifying the Language::Expr::Parser module.

=head2 The parser is too slow!

I personally am not having problem with performance. In fact,
L<Regexp::Grammmars> should be much faster than
L<Parse::RecDescent>. If you need faster parsing speed you can take a
look at reimplementing the parser using L<Parse::Yapp>,
L<Parse::Eyapp>, etc.

=head2 How to show details of errors in expression?

This is a TODO item.

=head1 BUGS

Due to possible bugs in Perl's RE engine or Regexp::Grammars or my
grammar, some syntax errors will cause further parsing to
fail. Variable interpolation inside double quoted strings also doesn't
work yet (segfaults).

=head1 SEE ALSO

Syntax reference: L<Language::Expr::Manual::Syntax>

Modules that are using Language::Expr: L<Data::Schema>,
L<Data::Template::Expr>.

Other related modules: L<Math::Expression>,
L<Math::Expression::Evaluator>, L<Language::Farnsworth>

=head1 AUTHOR

  Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

