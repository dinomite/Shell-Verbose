#!/usr/bin/env perl
use strict;
use warnings;
use lib "lib";

use Test::More tests => 6;
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

Shell::Verbose->prefix('===> ');
$expected = "===> echo 'foo'\nfoo\n";
($stdout, $stderr) = capture {
    vsys("echo 'foo'");
};
ok $stdout eq $expected;
Shell::Verbose->prefix('');

Shell::Verbose->before('above');
$expected = "above\necho 'foo'\nfoo\n";
($stdout, $stderr) = capture {
    vsys("echo 'foo'");
};
ok $stdout eq $expected;
Shell::Verbose->before('');

Shell::Verbose->after('below');
$expected = "below\necho 'foo'\nfoo\n";
($stdout, $stderr) = capture {
    vsys("echo 'foo'");
};
ok $stdout eq $expected;
Shell::Verbose->after('');
