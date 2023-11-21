#!/usr/bin/perl -w
use strict;

my $qin = shift;
my $nth = shift;
$nth = 0 unless $nth;

my %sq;
my $id;
open(IN, $qin);
while (<IN>) {

    if (/^\@(\S+)/) {
        $id = $1;
        next;
    }
    
    if ($id) {
        $id = undef;
        chomp();
        tr/ACGTN/acgtn/;
        my $c = () = $_ =~ /n/g;
        next if $c > $nth;
        $sq{$_}++;
    }
}
close(IN);

my @sn = keys %sq;
my $sn = scalar @sn;
my $il = length($sn);

my $c;
my $fout = $qin;
$fout =~ s/fq$/fa/;

open(FOUT, ">$fout");
foreach my $sq (sort {length($a) <=> length($b)} keys %sq){
    my $id = sprintf("%0${il}d", ++$c);
    print FOUT ">$id $sq{$sq}\n$sq\n";
}
close(FOUT);

