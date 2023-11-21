#!/usr/bin/perl -w
use strict;

my $in = shift;
my $c;

my (%hit, %max);
open(IN, $in);
while (<IN>) {
    chomp();
    my @tmp = split/\s/;
    my $data = $_;
    
    if (!defined($max{$tmp[0]}) || $max{$tmp[0]} < $tmp[14]) {
        $max{$tmp[0]} = $tmp[14];

        delete($hit{$tmp[0]}) if $hit{$tmp[0]};
        push(@{$hit{$tmp[0]}}, $data);

    } elsif ($max{$tmp[0]} == $tmp[14]){
        push(@{$hit{$tmp[0]}}, $data);
    }
}
close(IN);

foreach my $id (sort keys %max) {
    print join("\n", @{$hit{$id}}), "\n";
}

