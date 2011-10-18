#!/usr/bin/env perl
use strict;
use warnings;
use lib "lib";

use Test::More tests => 3;
use Capture::Tiny qw/capture/;

BEGIN { use_ok 'Shell::Verbose'; }
use Shell::Verbose qw/verboseSystem vsys/;


my ($stdout, $stderr) = capture {
    verboseSystem("echo 'foo'");
};
my $expected = "echo 'foo'\nfoo\n";
ok $stdout eq $expected;

($stdout, $stderr) = capture {
    vsys("echo 'foo'");
};
ok $stdout eq $expected;
