#!/usr/bin/env perl
use strict;
use warnings;
use lib "lib";

use Test::More tests => 2;
use Capture::Tiny qw/capture/;

BEGIN { use_ok 'Shell::Verbose'; }
use Shell::Verbose qw/verboseSystem/;


my ($stdout, $stderr) = capture {
    verboseSystem("echo 'foo'");
};
my $expected = "echo 'foo'\nfoo\n";
ok $stdout eq $expected;
