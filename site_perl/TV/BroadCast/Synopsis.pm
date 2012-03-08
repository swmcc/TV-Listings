package TV::BroadCast::Synopsis; 

#------------------------------------------------------------------------------
#
# Copyright  (c) SWM 2006 
#
#------------------------------------------------------------------------------
#
# Modification History
#
# Auth    Date       Description
# ------  ---------  ----------------------------------------------------------
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
TV::BroadCast::Synopsis->table('broadcast_synopsis');
TV::BroadCast::Synopsis->columns( Primary => 'id' );
TV::BroadCast::Synopsis->columns( All     => qw/broadcast programme channel synopsis/ );

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

CREATE TABLE broadcast_synopsis (
  id int(8) unsigned NOT NULL auto_increment,
  channel int(8) unsigned NOT NULL default 0,
  programme int(8) unsigned NOT NULL default 0,
  synopsis` text NOT NULL,
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
