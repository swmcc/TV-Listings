package TV::Channel; 

#------------------------------------------------------------------------------
#
# Copyright  (c) SWM 2006 - 2013
#
#------------------------------------------------------------------------------
#
# Modification History
#
# Auth    Date       Description
# ------  ---------  ----------------------------------------------------------
# SWM     24 Jan 13  Renamed table to channels    
# SWM     11 Aug 06  Wrote this
#------------------------------------------------------------------------------

=head1 NAME

TV::Channel - One line statement. 

=head1 SYNOPSIS

How this works (how to use it)

=head1 DESCRIPTION

A short description about what you are writing.

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;

use base qw(TV::DBI);
TV::Channel->table('channels');
TV::Channel->columns( Primary => 'channelid' );
TV::Channel->columns( All     => qw/xmltv_id name active/ );

sub active {
  my $class = shift;
  return $class->search({ active => 'y' });
}    
sub for_xmltv_id {
  my ($class, $xmltv_id) = @_;
  return $class->search({ xmltv_id => $xmltv_id });
}

sub image {
  my ($self, $link) = @_; 

  my $file = "/var/web/whatisonthe.tv/www/images/channels/%s.png";
  
  if ( not defined $link ) { 
    $link = sprintf q{ /x/channel/%d}, $self->id; 
  } 

  my $image = ( -e sprintf($file, $self->id) ) ? $self->id : 'blank';
  my $path  = "/images/channels/$image.png";
   
  return sprintf q{ <a href="%s"><img src="%s" border="0"></a>}, $link, $path 
}

=head1 FACTORY METHODS

=head2 create

=head2 retrieve

=head1 CLASS METHODS

=head1 INSTANCE METHODS


=head2 methodname 
  
  synopsis 

quick description

=cut

=head1 DEFENTION

CREATE TABLE channel (
  channelid int(8) unsigned NOT NULL auto_increment,
  xmltv_id varchar(100) default NULL,
  name varchar(100) NOT NULL default '',
  PRIMARY KEY channelid (channelid)
) TYPE=MyISAM;


=head1 BUGS

=over 4

=item * None Known.

=back

=head1 TODO

=over 4

=item * Nothing Known.

=back

=cut

1;
