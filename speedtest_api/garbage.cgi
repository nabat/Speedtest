#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Crypt::OpenSSL::Random;

# Headers
  print "HTTP/1.1 200 OK";
# # Download follows...
  print "Content-Description: File Transfer";
  print "Content-Type: application/octet-stream";
  print "Content-Disposition: attachment; filename=random.dat";
  print "Content-Transfer-Encoding: binary";
# Never cache me
  print "Cache-Control: no-store, no-cache, must-revalidate, max-age=0";
  print "Cache-Control: post-check=0, pre-check=0";
  print "Pragma: no-cache";
# Generate data
#   $data=openssl_random_pseudo_bytes(1048576);
  my $data = Crypt::OpenSSL::Random::random_pseudo_bytes(1048576);

# Deliver chunks of 1048576 bytes
  for(my $i=0; $i < 64; $i++){
  print $data;
}

  print $data;
return 1;