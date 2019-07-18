#!/usr/bin/perl
use strict;
use warnings;
use Crypt::OpenSSL::Random;
use CGI;
my $c;
$c = CGI->new();

print "Content-Type: text/html\n\n";

# use HTTP::Response;
#
# my $respbody = '<root/>';
# my $response;
#
# $response = HTTP::Response->new('200','Ok');
# $response->header('Content-Description' => 'File Transfer');
# $response->header('Content-Type' => 'application/octet-stream');
# $response->header('Content-Disposition' => 'attachment; filename=random.dat');
# $response->header('Content-Transfer-Encoding' => 'binary');
# $response->header('Cache-Control' => 'no-store, no-cache, must-revalidate, max-age=0');
# $response->header('Cache-Control' => 'post-check=0, pre-check=0');
# $response->header('Pragma' => 'no-cache');
# $response->content($respbody);
#
# print $response->as_string;

# Headers
#   print "HTTP/1.1 200 OK\n\n";
# # # Download follows...
#   print "Content-Description: File Transfer\n\n";
#   print "Content-Type: application/octet-stream\n\n";
#   print "Content-Disposition: attachment; filename=random.dat\n\n";
#   print "Content-Transfer-Encoding: binary\n\n";
# # Never cache me
#   print "Cache-Control: no-store, no-cache, must-revalidate, max-age=0\n\n";
#   print "Cache-Control: post-check=0, pre-check=0\n\n";
#   print "Pragma: no-cache\n\n";
# Generate data
#   $data=openssl_random_pseudo_bytes(1048576);
  my $data = Crypt::OpenSSL::Random::random_pseudo_bytes(1048576);
  my $chunks;
# Deliver chunks of 1048576 bytes
  if ($c->param('ckSize') != 0) {   #$c->param('ckSize')
    $chunks = $c->param('ckSize');
  }
  else{
    $chunks = 4;
  }

  if ($chunks == 0) {
    $chunks = 4;
  }
  if ($chunks>1024) {
    $chunks = 1024;
  }
    for(my $i=0; $i < $chunks; $i++){
    print $data;
  }

  # print $data;
1;