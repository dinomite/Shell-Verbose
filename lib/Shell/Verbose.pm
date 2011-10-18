package Shell::Verbose;
use strict;
use warnings;

our ($VERSION, @ISA, @EXPORT_OK);
BEGIN {
    $VERSION = '1.02';

    require Exporter;
    @ISA = qw(Exporter);
    @EXPORT_OK = qw(verboseSystem vsys);
}

my $prefix = '';
my $before = '';
my $after = '';

sub prefix {
    $prefix = shift;
}

sub before {
    $before = shift;
}

sub after {
    $before = shift;
}

sub verboseSystem {
    my $command = shift;

    print $before if ($before);
    print $prefix . $command . "\n";
    my $ret = (system($command) == 0);
    print $after if ($after);
    return $ret;
}

sub vsys {
    verboseSystem(@_);
}

1;
