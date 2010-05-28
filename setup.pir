#!/usr/bin/env parrot
# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    $P0 = new 'Hash'
    $P0['name'] = 'Lazy K'
    $P0['abstract'] = 'Lazy K is a pure functional programming language.'
    $P0['authority'] = 'http://github.com/bschmalhofer'
    $P0['description'] = 'LazyK is a pure functional programming language. See http://esolangs.org/wiki/Lazy_K.'
    $P0['license_type'] = 'Artistic License 2.0'
    $P0['license_uri'] = 'http://www.perlfoundation.org/artistic_license_2_0'
    $P0['copyright_holder'] = 'Parrot Foundation'
    $P0['checkout_uri'] = 'git://github.com/bschmalhofer/lazy-k.git'
    $P0['browser_uri'] = 'http://github.com/bschmalhofer/lazy-k'
    $P0['project_uri'] = 'http://github.com/bschmalhofer/lazy-k'

    # build
    $P1 = new 'Hash'
    $P1['lazy.pbc'] = 'lazy.pir'
    $P0['pbc_pir'] = $P1

    $P2 = new 'Hash'
    $P2['parrot-lazy'] = 'lazy.pbc'
    $P0['installable_pbc'] = $P2

    # test
    $P0['test_exec'] = 'perl'

    .tailcall setup(args :flat, $P0 :flat :named)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
