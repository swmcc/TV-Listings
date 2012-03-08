package TV::Programme; 

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
use TV::Star;
use TV::Director;
use TV::Programme::Star;
use TV::Programme::Director;

TV::Programme->table('programme');
TV::Programme->columns( Primary => 'id' );
TV::Programme->columns( All     => qw/title category/ );
TV::Programme->has_many( 'stars', 'TV::Programme::Star' => 'programme' );
TV::Programme->has_many( 'directors', 'TV::Programme::Director' => 'programme' );
TV::Programme->has_a( 'category', 'TV::Category' => 'category' );

sub add_stars {
  my ($self, $stars) = @_;

  foreach my $name ( @{$stars} ) {
     my $star = TV::Star->find_or_create({ name => $name });
     TV::Programme::Star->find_or_create({ star => $star->id, programme => $self->id })
  }    
}    

sub add_directors {
  my ($self, $directors) = @_;

  foreach my $name ( @{$directors} ) {
     my $director = TV::Director->find_or_create({ name => $name });
     TV::Programme::Director->find_or_create({ director => $director->id, programme => $self->id })
  }    
}    

sub broadcasts {
  my $self = shift;

  require SWM::Date;
  require TV::BroadCast;
  require TV::Database;
  
  my $today = SWM::Date->today;
  my $dbh   = TV::Database->new;

  my $sth = $dbh->prepare(q{
      SELECT b.id 
       FROM broadcasts b, channel c
      WHERE b.programme = ?
        AND b.channel = c.channelid
        AND c.active = 'y'
        AND b.broadcast_date >= ? 
  });

  my @objs = map { TV::BroadCast->new($_) } @{ $dbh->selectcol_arrayref($sth, undef, $self->id, $today) };

  my %broadcasts;
  foreach my $broadcast ( @objs ) {
    my $key = join(":", $broadcast->id, $broadcast->channel->id);   
    $broadcasts{$key} = $broadcast;
  }    
  return \%broadcasts;
}    

sub future_broadcasts {
	my $self = shift;
	
	require SWM::Date;
	require TV::Database;

	my $today = shift || SWM::Date->today;
  	my $dbh   = TV::Database->new;

	my $q_get_broadcasts = $dbh->prepare(q{
			SELECT p.id, p.title, sub_title, c.name, ctg.name, b.start_time, b.end_time, b.broadcast_date, bs.synopsis, b.id
			FROM programme p, broadcasts b, channel c, category ctg, broadcast_synopsis bs
			WHERE b.programme = ? 
			AND b.synopsis = bs.id
			AND b.programme = p.id
			AND ctg.id = p.category
			AND c.channelid = b.channel
			AND b.broadcast_date >= ? 
        });

	$q_get_broadcasts->execute( $self->id, $today );
	$q_get_broadcasts->bind_columns( \my $prog_id, \my $title, \my $sub_title, \my $channel, \my $category, \my $start, \my $end, \my $date, \my $synopsis, \my $bid );

	my %broadcasts = ();
	while ( $q_get_broadcasts->fetch ) {
         my $key = "$prog_id:$channel";
                my $ep_key = "$sub_title:$date";
                push @{$broadcasts{$key}{episodes}{$ep_key}{times}}, "$start - $end";
                $broadcasts{$key}{sub_title} = ( defined $sub_title ) ? $sub_title : "";
                $broadcasts{$key}{title} = $title;
                $broadcasts{$key}{channel} = $channel;
                $broadcasts{$key}{category} = ucfirst($category);
                $broadcasts{$key}{episodes}{$ep_key}{date} = $date;
                $broadcasts{$key}{episodes}{$ep_key}{subtitle} = $sub_title;
                $broadcasts{$key}{bid} = $bid;
	}

	return \%broadcasts;
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
