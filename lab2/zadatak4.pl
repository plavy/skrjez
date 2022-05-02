#!/usr/bin/perl -w

while(<>) {
  push @linije, $_;
}

foreach (@linije) {
  if(/[0-9]/) {
    /(.*);(.*);(.*);([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}):[0-9]{2}.*;([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/;
    $jmbag = $1;
    $prezime = $2;
    $ime = $3;
    $pocetak_dan = $4;
    $pocetak_sat = $5;
    $kraj_dan = $6;
    $kraj_vrijeme = $7;
    $kraj_vrijeme =~ /([0-9]{2})/;
    $kraj_sat = $1;
    if ($pocetak_dan ne $kraj_dan || $pocetak_sat ne $kraj_sat) {
      print "$jmbag $prezime $ime - PROBLEM: $pocetak_dan $pocetak_sat:00 --> $kraj_dan $kraj_vrijeme", "\n";
    }
  }
}
