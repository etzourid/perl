# Test to make sure object can be instantiated for udp protocol.
# I do not know of any servers that support udp echo anymore.

use Test;
use Net::Ping;
plan tests => 2;

# Everything loaded fine
ok 1;

my $p = new Net::Ping "udp";
ok !!$p;
