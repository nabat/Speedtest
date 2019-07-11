#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Crypt::OpenSSL::Random;
use CGI qw();

my $c = CGI->new;

# Headers
  print $c->header( "HTTP/1.1 200 OK" );
# Download follows...
  print $c->header('Content-Description: File Transfer');
  print $c->header('Content-Type: application/octet-stream');
  print $c->header('Content-Disposition: attachment; filename=random.dat');
  print $c->header('Content-Transfer-Encoding: binary');
# Never cache me
  print $c->header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
  print $c->header("Cache-Control: post-check=0, pre-check=0", false);
  print $c->header("Pragma: no-cache");
# Generate data
#   $data=openssl_random_pseudo_bytes(1048576);
  $data = Crypt::OpenSSL::Random::random_pseudo_bytes(1048576);

# Deliver chunks of 1048576 bytes
  for($i=0;$i<$c->param("ckSize");$i++){
  print $data;
}
return 1;