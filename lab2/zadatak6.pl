#!/usr/bin/perl -w

# bash: export LC_ALL=hr_HR.UTF-8

use open ':locale';
use locale;

$n = pop @ARGV;

while(<>) {
  @lin_prefs = /\b(\w{$n})\w*\b/g;
  push @prefs, @lin_prefs;
}

@prefs = sort @prefs;

$pref = shift @prefs;
$count = 1;
foreach (@prefs) {
  if(! /$pref/i) {
    print "$pref : $count", "\n";
    $pref = $_;
    $count = 0;
  }
  $count++;
}
print "$pref : $count", "\n";
