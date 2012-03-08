package TV::BroadCast; 

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
TV::BroadCast->table('broadcasts');
TV::BroadCast->columns( Primary => 'id' );
TV::BroadCast->columns( All     => qw/programme channel broadcast_date start_time end_time sub_title synopsis/ );
TV::BroadCast->columns( All     => qw/programme channel broadcast_date start_time end_time sub_title synopsis/ );
TV::BroadCast->has_a( programme => 'TV::Programme' );
TV::BroadCast->has_a( channel   => 'TV::Channel' );
TV::BroadCast->has_a( synopsis  => 'TV::BroadCast::Synopsis' );
TV::BroadCast->has_a(
  broadcast_date => 'SWM::Date',
  inflate => 'new',
  deflate => undef,
);


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
