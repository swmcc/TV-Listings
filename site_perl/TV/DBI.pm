package TV::DBI;
use base qw(Class::DBI);

__PACKAGE__->set_db( 'Main', "dbi:mysql:db", 'username', 'password');
__PACKAGE__->autoupdate(1);

sub new { 
  my $class = shift;
  my $wank  = shift;

  return $class->SUPER::retrieve( $wank );
}
