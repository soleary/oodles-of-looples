#!/usr/bin/env perl

use 5.010;

my $magic = $ARGV[0] // 2;

use feature 'say';

say 'for (range)';
for my $c (0..$magic) {
    say $c;
}

say 'c-style for';
my $d;
for ($d = 0; $d < $magic+1; $d++) {
    say $d;
}

my @nums = (0..$magic);

say 'foreach (@array)';
foreach my $e (@nums) {
    say $e;
}

say 'while';
my $f = 0;
while ($f < $magic+1) {
    say $f;
} continue {
    $f++;
}

say 'until';
my $g = 0;
until ($g > $magic) {
    say $g;
} continue {
    $g++;
}

say 'do until/while';
my $h = 0;
do {
    say $h;
    $h++;
} until ($h > $magic);

say 'goto block';
my $i = 0;
FOO: {
    say $i;
    $i++;
    goto FOO if ($i < $magic+1);
}

say 'postfix for/foreach';
say $_ foreach (@nums);

say 'postfix while/until';
my $j = 0;
say $j++ while ($j < $magic+1);

say 'map';
map { say $_ } @nums;

say 'recursion';
sub baz {
    my $k = $_[0];
    return $k if $k > $magic;
    say $k++;
    return baz($k);
}
baz(0);
