package TV::Star;

#------------------------------------------------------------------------------
#
# Copyright  (c) SWM 2003 - 2004 
#
#------------------------------------------------------------------------------
#
# Modification History
#
# Auth    Date       Description
# ------  ---------  ----------------------------------------------------------
# SWM     22 Mar 04  Amended the image to check if the image exists in 
#                      /web/whatisonthe.tv and not /web/tv.theotherdomain.com
# SWM     20 Mar 04  Added find_or_create again. Was failing tests! 
# SWM     14 Mar 04  Took away find_or_create, don't know why I rolled my own
#                      anyway.  
# SWM     21 Nov 03  Added programmes and guest_apperance method. 
# SWM     17 Nov 03  Added the imdb_id, image and imdb_url methods.
# SWM     16 Oct 03  Wrote this
#------------------------------------------------------------------------------

=head1 NAME

TV::Star - Deals with a star :). 

=head1 SYNOPSIS

  my $star = TV::Star->find_or_create({
    name => $name,
  });

  my $star = TV::Star->retreive( $starid );

  my $name    = $star->name;
  my $image   = $star->image;
  my $imdbid  = $star->imdb_id;
  my $url     = $star->imdb_url;
=head1 DESCRIPTION

This simply deals with a star. A star is someone that stars in /any/ episode 
that our in the tv listings. It doesn't matter if the person is an actor,
host or singer. It takes everyone that 'stars' in a showing/programme
and puts them in the database.

We get our stars from three sources. 

=over 4

=item * EPGUIDES

We parse the feed we get for 'series linker' episodes. Since we care enough
about these programmes to get episode information we assume that people want
to know about their stars. So, we get the list of stars from the feed. We then
use find_or_create to create or find their TV::Star object, and then
we map them into the appropriate programme in another module 
(Listings::Programme::Star). 

=item * SYNOPSIS

We now and again get our star information from the database. When a daily feed
is done we go through the new synopsis and look for star information. 
(see /usr/local/bin/listings/get_star_list_from_synopsis). 

=item * MANUAL

We sometimes want to add a star that isn't in either the synopsis or epguides
feed. So we enter them by hand.
(see /usr/local/bin/listing/add_listings_star).

=break

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;

use base qw(TV::DBI);
__PACKAGE__->table('star');
__PACKAGE__->columns( Primary => 'id' );
__PACKAGE__->columns( All     => qw/name imdb_id/ );

sub image {
	my $self = shift;
	my $id = $self->id;

	my $path;	
	if ( -e "/www/tv.swm.cc/www/img/stars/$id.jpg" ) {
		$path = "/img/stars/$id.jpg";
	} else {
		$path = "/img/stars/default.gif";
	}
	return $path;
}

sub thumb_image {
	my $self = shift;
	my $id = $self->id;

	my $path;	
	if ( -e "/www/tv.swm.cc/www/img/stars/$id" . "_thumb.jpg" ) {
		$path = "/img/stars/$id" . "_thumb.jpg";
	} else {
		$path = "/img/stars/default_thumb.gif";
	}
	return $path;
}

=head1 BUGS

None Known.

=head1 TODO

=over 4

=item * Test the programmes and guest_apperances method.  

=item * Stop rolling the URL and domain.

=break

=cut

1;
