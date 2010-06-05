package Dist::Zilla::Plugin::EOLTests;
BEGIN {
  $Dist::Zilla::Plugin::EOLTests::AUTHORITY = 'cpan:FLORA';
}
BEGIN {
  $Dist::Zilla::Plugin::EOLTests::VERSION = '0.02';
}
# ABSTRACT: Release tests making sure correct line endings are used

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::TextTemplate';


has trailing_whitespace => (
    is      => 'ro',
    isa     => 'Bool',
    default => 1,
);

around add_file => sub {
    my ($orig, $self, $file) = @_;
    return $self->$orig(
        Dist::Zilla::File::InMemory->new({
            name    => $file->name,
            content => $self->fill_in_string(
                $file->content,
                { trailing_ws => \$self->trailing_whitespace },
            ),
        }),
    );
};

__PACKAGE__->meta->make_immutable;

1;



=pod

=head1 NAME

Dist::Zilla::Plugin::EOLTests - Release tests making sure correct line endings are used

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=over 4

=item *

xt/release/eol.t

a standard Test::EOL test

=back

=head1 ATTRIBUTES

=head2 trailing_whitespace

If this option is set to a true value,
C<< { trailing_whitespace => 1 } >> will be passed to
L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.

=head1 AUTHOR

Florian Ragwitz <rafl@debian.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Florian Ragwitz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/eol.t ]___
use strict;
use warnings;
use Test::More;

eval 'use Test::EOL';
plan skip_all => 'Test::EOL required' if $@;

all_perl_files_ok({ trailing_whitespace => {{ $trailing_ws }} });
