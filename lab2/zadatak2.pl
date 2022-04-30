#!/usr/bin/perl -w

@brojevi = <STDIN>;

foreach (@brojevi) {$sum += $_;}

print "Aritmetička sredina: ", $sum / @brojevi, "\n";
