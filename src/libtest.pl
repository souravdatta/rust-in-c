use strict;
use warnings;

use FFI::Raw;

my $adder = FFI::Raw->new(
    'target/debug/liblibrst1.dylib',
    'add',
    FFI::Raw::int,
    FFI::Raw::int, FFI::Raw::int
);

print $adder->call(234, 432), "\n";
