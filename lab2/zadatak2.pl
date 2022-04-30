#!/usr/bin/perl -w

@brojevi = <STDIN>;

foreach (@brojevi) {$sum += $_;}

print "Aritemtička sredina: ", $sum / @brojevi, "\n";
