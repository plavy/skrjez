#!/usr/bin/perl -w

use open ':locale';
use locale;

$udjeli_ucitani = 0;

while(<>) {
  if(! /^#/ and /.+/) {
    if(! $udjeli_ucitani) {
      @udjeli = split /;/;
      $udjeli_ucitani = 1;
    } else {
      /(\d{10});([^;]*);([^;]*);(.*)/;
      @bodovi = split /;/, $4;
      $sum = 0;
      $i = 0;
      foreach $broj (@bodovi) {
        if ($broj =~ /\d/) {
          $sum += $broj * $udjeli[$i];
        }
        $i++;
      }
      push @lista, [ $1, $2, $3, $sum ];
    }    
  }
}

@lista = reverse sort {$$a[3] <=> $$b[3]} @lista;

$i = 0;
print "\n", "Lista po rangu:", "\n";
print "-------------------", "\n";
foreach (@lista) {
  $i++;
  $podaci = "$$_[1], $$_[2] ($$_[0])";
  $br_bod = $$_[3];
  printf "%3d. %-33s : %.2f\n", $i, $podaci, $br_bod;
}
