package Tree;

=head1 NAME

  SpeedTest - module for SpeedTest configuration

=head1 SYNOPSIS

  use SpeedTest;
  my $SpeedTest = SpeedTest->new($db, $admin, \%conf);

=cut

use strict;
use parent 'main';
my ($admin, $CONF);

#*******************************************************************
#  Инициализация обьекта
#*******************************************************************
sub new {
  my $class = shift;
  my $db    = shift;
  ($admin, $CONF) = @_;

  my $self = {};
  bless($self, $class);

  $self->{db}    = $db;
  $self->{admin} = $admin;
  $self->{conf}  = $CONF;

  return $self;
}

1;
