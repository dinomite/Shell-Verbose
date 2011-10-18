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
    system($command);
    print $after if ($after);
}

sub vsys {
    verboseSystem(@_);
}
