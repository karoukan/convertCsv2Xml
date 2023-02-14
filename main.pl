#!/usr/bin/perl

use strict;
use warnings;

my $input_file = "data.csv";
my $output_file = "loadmap_test.xml";

open my $fh, "<", $input_file or die "$!";

my $header = <$fh>;
chomp $header;
my @headers = split /;/, $header;

open my $ofh, ">", $output_file or die "$!";

print $ofh "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
print $ofh "<data>\n";

while (my $line = <$fh>) {
    chomp $line;
    my @values = split /;/, $line;
    print $ofh "  <item>\n";

    for (my $i = 0; $i < @headers; $i++) {
        if (defined $values[$i]) {
            print $ofh "    <$headers[$i]>$values[$i]</$headers[$i]>\n";
        }
    }

    print $ofh "  </item>\n";
}

print $ofh "</data>\n";

close $fh;
close $ofh;
