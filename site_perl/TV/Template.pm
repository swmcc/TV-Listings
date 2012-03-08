package TV::Template; 

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

TV::Template - One line statement. 

=head1 SYNOPSIS

How this works (how to use it)

=head1 DESCRIPTION

A short description about what you are writing.

=cut

#------------------------------------------------------------------------------
use strict;
use warnings;



use Template;
use vars qw(@ISA);

@ISA = qw(Template);

=head2 new

  my $t = TV::Template->new;

Makes a brand new TV::Template instance for you to play with.

=cut

my $t;

sub new {
    my $class = shift;
    unless ( defined $t ) {
        $t = $class->SUPER::new(
            INCLUDE_PATH => [
                   '/var/templates/src/whatisonthe.tv/',
                   '/var/templates/lib/whatisonthe.tv/',
            ],
            PLUGIN_BASE  => 'TV::Template::Plugin',
        );
    }
    return $t;
}

=head2 process

  $t->process('foo/bar', $hash_ref );

Process the template passed in. It takes a hash_ref of arguments.

=cut

#sub process {
#    my $class = shift;
#    my $file  = shift or die "process needs a file";
#    my $vars  = shift;
#
#    my $object = $class->new();
#    $object->SUPER::process( $file, $vars ) or warn $object->error();
#}

sub process {
  my ($self, $template, $vars, @args) = @_;
  #if ( defined $vars and ref($vars) eq 'HASH' ) {
  #  $vars->{env} = _get_env();
  #}
  return $self->SUPER::process($template, $vars, @args);
}



=head2 methodname 
  
  synopsis 

quick description

=cut

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
