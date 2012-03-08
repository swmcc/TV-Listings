package TV::Programme::Star;

#------------------------------------------------------------------------------
#
# Copyright  (c) SWM 2003
#
#------------------------------------------------------------------------------
#
# Modification History
#
# Auth    Date       Description
# ------  ---------  ----------------------------------------------------------
# SWM     16 Oct 03  Wrote this
#------------------------------------------------------------------------------

=head1 NAME

Listings::Programme::Star - Deals with stars in a programme.

=head1 SYNOPSIS

=head1 DESCRIPTION

This maps stars to programmes. For example 'Martin Sheen' stars in 'The West
Wing'. He plays 'President Bartlet'. This is exactly what this does, nothing
more or nothing less.

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;

use base qw(TV::DBI);
__PACKAGE__->table('programme_star');
__PACKAGE__->columns( Primary => 'id' );
__PACKAGE__->columns( All     => qw(star programme) );
__PACKAGE__->has_a( star      => 'TV::Star' );
__PACKAGE__->has_a( programme => 'TV::Programme' );

1;
