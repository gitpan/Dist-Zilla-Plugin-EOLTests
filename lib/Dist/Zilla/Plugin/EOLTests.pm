package Dist::Zilla::Plugin::EOLTests;
BEGIN {
  $Dist::Zilla::Plugin::EOLTests::AUTHORITY = 'cpan:FLORA';
}
BEGIN {
  $Dist::Zilla::Plugin::EOLTests::VERSION = '0.01';
}
# ABSTRACT: Release tests making sure correct line endings are used

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::InlineFiles';


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

all_perl_files_ok();
