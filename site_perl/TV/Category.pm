package TV::Category;

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
# SWM     
#------------------------------------------------------------------------------

=head1 NAME

TV::Category - Deals with a programmes category. 

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;

use base qw(TV::DBI);
TV::Category->table('category');
TV::Category->columns( Primary => 'id' );
TV::Category->columns( All     => qw/name/ );

=head2 find_or_create
  
  my $ct = TV::Category->find_or_create({ category => $category });

This method finds or creates a TV::Category object for you to 
play with. You must pass in a hash_ref with an element called category.

=head2 retrieve 
  
  my $ct = TV::Category->retrieve( $categoryid );

Returns an instance of a TV::Category object for you to play
with. You must pass in a valid categoryid as a number.

=cut

=head2 category

  my $category = $ct->category;

Returns the category of the current object. It is a description.   

=head2 retrieve_all

  my @cats = TV::Category->retreive_all;

Returns all the TV::Category objects back as a list.

=head1 BUGS

None Known.

=head1 TODO

=over 4

=item * Nothing Known.

=back

=cut

1;
