#!/usr/bin/env perl
use strict;
use English;
$WARNING = 1;

# It would be nicer for this to give file names and line numbers, like grep
# and similar tools do.

# Read by paragraphs
$/ = "";
my $line;
while (defined($line = <>)) {
  # "\w" includes numbers, "\W" includes ".", so "3.3" triggers a problem.
  # "-" should be included in word constituent, probably

  if ($line =~ /(\b(\w+)\b\W+\b\2\b)/) {
    print "REPEAT: $1\n";
    print $line;
  }
}
