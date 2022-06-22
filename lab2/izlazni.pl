#!/usr/bin/perl -w

use open ':locale';
use locale;

@addresses = [];
@counts = [];

while(<>) {
  if (/^From: .* <([^<>]+@[^<>]+)>/) {
    push @addresses, $1;
  }
}

$last = "a";
$count = 0;
foreach (sort @addresses) {
  if ($_ ne $last) {
    if ($last =~ /[^<>]+@[^<>]+/) {
      push @counts, [$last, $count];
    }
    $count = 0;
    $last = $_;
  }
  $count++;
}
if ($last =~ /[^<>]+@[^<>]+/) {
  push @counts, [$last, $count];
}
shift @counts;

@counts = sort {$$a[1] <=> $$b[1]} @counts;

print "\n";
foreach (@counts) {
  $stars = "*" x $$_[1];
  printf "%40s: %s (%d)\n", $$_[0], $stars, $$_[1];
}


