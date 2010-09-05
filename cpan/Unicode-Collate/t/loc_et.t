#!perl
use strict;
use warnings;
use Unicode::Collate::Locale;

use Test;
plan tests => 53;

my $objEt = Unicode::Collate::Locale->
    new(locale => 'ET', normalization => undef);

ok(1);
ok($objEt->getlocale, 'et');

$objEt->change(level => 1);

ok($objEt->lt("s", "s\x{30C}"));
ok($objEt->gt("z", "s\x{30C}"));
ok($objEt->lt("z", "z\x{30C}"));
ok($objEt->gt("t", "z\x{30C}"));
ok($objEt->eq("v", "w"));
ok($objEt->lt("w", "o\x{303}"));
ok($objEt->lt("o\x{303}", "a\x{308}"));
ok($objEt->lt("a\x{308}", "o\x{308}"));
ok($objEt->lt("o\x{308}", "u\x{308}"));
ok($objEt->lt("u\x{308}", "x"));

# 12

$objEt->change(level => 2);

ok($objEt->lt("v", "w"));
ok($objEt->eq("s\x{30C}", "S\x{30C}"));
ok($objEt->eq("z", "Z"));
ok($objEt->eq("z\x{30C}", "Z\x{30C}"));
ok($objEt->eq("w", "W"));
ok($objEt->eq("o\x{303}", "O\x{303}"));
ok($objEt->eq("a\x{308}", "A\x{308}"));
ok($objEt->eq("o\x{308}", "O\x{308}"));
ok($objEt->eq("u\x{308}", "U\x{308}"));

# 21

$objEt->change(level => 3);

ok($objEt->lt("s\x{30C}", "S\x{30C}"));
ok($objEt->lt("z", "Z"));
ok($objEt->lt("z\x{30C}", "Z\x{30C}"));
ok($objEt->lt("w", "W"));
ok($objEt->lt("o\x{303}", "O\x{303}"));
ok($objEt->lt("a\x{308}", "A\x{308}"));
ok($objEt->lt("o\x{308}", "O\x{308}"));
ok($objEt->lt("u\x{308}", "U\x{308}"));

# 29

ok($objEt->eq("s\x{30C}", "\x{161}"));
ok($objEt->eq("S\x{30C}", "\x{160}"));
ok($objEt->eq("z\x{30C}", "\x{17E}"));
ok($objEt->eq("Z\x{30C}", "\x{17D}"));
ok($objEt->eq("o\x{303}", pack('U', 0xF5)));
ok($objEt->eq("O\x{303}", pack('U', 0xD5)));
ok($objEt->eq("a\x{308}", pack('U', 0xE4)));
ok($objEt->eq("A\x{308}", pack('U', 0xC4)));
ok($objEt->eq("a\x{308}\x{304}", "\x{1DF}"));
ok($objEt->eq("A\x{308}\x{304}", "\x{1DE}"));
ok($objEt->eq("o\x{308}", pack('U', 0xF6)));
ok($objEt->eq("O\x{308}", pack('U', 0xD6)));
ok($objEt->eq("o\x{308}\x{304}", "\x{22B}"));
ok($objEt->eq("O\x{308}\x{304}", "\x{22A}"));
ok($objEt->eq("u\x{308}", pack('U', 0xFC)));
ok($objEt->eq("U\x{308}", pack('U', 0xDC)));
ok($objEt->eq("u\x{308}\x{300}", "\x{1DC}"));
ok($objEt->eq("U\x{308}\x{300}", "\x{1DB}"));
ok($objEt->eq("u\x{308}\x{301}", "\x{1D8}"));
ok($objEt->eq("U\x{308}\x{301}", "\x{1D7}"));
ok($objEt->eq("u\x{308}\x{304}", "\x{1D6}"));
ok($objEt->eq("U\x{308}\x{304}", "\x{1D5}"));
ok($objEt->eq("u\x{308}\x{30C}", "\x{1DA}"));
ok($objEt->eq("U\x{308}\x{30C}", "\x{1D9}"));

# 53