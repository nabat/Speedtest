#!/usr/bin/perl
use strict;
use warnings;

print "HTTP/1.1 200 OK\n\n";
print "Cache-Control: no-store, no-cache, must-revalidate, max-age=0\n\n";
print "Cache-Control: post-check=0, pre-check=0\n\n";
print "Pragma: no-cache\n\n";
print "Connection: keep-alive\n\n";
1;