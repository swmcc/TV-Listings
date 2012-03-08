package TV::Database;

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
# SWM     17 Oct 03  Wrote this
#------------------------------------------------------------------------------

=head1 NAME

Listings::Database - Gets a connection to the Listings Database. 

=head1 SYNOPSIS

 my $dbh = Listings::Database->new; 

=head1 DESCRIPTION

Simply gets a persistent connection to the Listings Database. Shouldn't be used
for much. 

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;
use DBI;

my $dbh;

=head2 new

 my $dbh = Listings::Database->new; 

Simply returns a database connection the listings database.

=cut

sub new {
    return $dbh if ( defined $dbh );
    $dbh = DBI->connect( "DBI:mysql:databasename", 'username', 'password' );
    return $dbh;
};

=head1 BUGS

None Known. 

=head1 TODO

=over 4

=item * Nothing Known.

=break

=cut

1;
