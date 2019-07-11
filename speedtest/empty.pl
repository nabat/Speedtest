#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use CGI qw();

my $c = CGI->new;

print $c->header( "HTTP/1.1 200 OK" );
print $c->header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
print $c->header("Cache-Control: post-check=0, pre-check=0", false);
print $c->header("Pragma: no-cache");
print $c->header("Connection: keep-alive");
return 1;