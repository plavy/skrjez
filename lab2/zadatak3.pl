#!/usr/bin/perl -w

$datoteka = "";
@sati = ();

@sati24 = (0..23);
foreach (@sati24) {
  if ($_ < 10) {
    $_ = "0$_";
  }
}

sub print_and_reset {
  if (@sati) {
    foreach $sat (@sati24) {
    $n = grep /$sat/, @sati;
    print "  $sat : $n\n";
    }
    @sati = ();
  }
}

while (<>) {
  if ($datoteka ne $ARGV) {
    &print_and_reset();
    $datum = $datoteka = $ARGV;
    $datum =~ s/.*([0-9]{4}-[0-9]{2}-[0-9]{2}).*/$1/g;
    print "\n"," Datum: ", $datum, "\n";
    print " sat : broj pristupa", "\n";
    print "-------------------------------", "\n";
  }
  if (/[0-9]{4}:([0-9]{2}):[0-9]{2}:[0-9]{2}/) {
    push @sati, $1;
  }
}
&print_and_reset();
