package Shell::Verbose;
use strict;
use warnings;

=head1 NAME

Shell::Verbose - A verbose version of system()

=head1 SYNOPSIS

use Shell::Verbose qw/verboseSystem vsys/;

verboseSystem('echo "foo"');
# echo "foo"
# foo

vyss('echo "foo"');
# echo "foo"
# foo

Shell::Verbose->prefix('===> ');

=head1 DESCRIPTION

A simple wrapper for system() that prints the command

=cut

our ($VERSION, @ISA, @EXPORT_OK);
BEGIN {
    $VERSION = '1.02';

    require Exporter;
    @ISA = qw/Exporter/;
    @EXPORT_OK = qw/verboseSystem vsys/;
}

my $prefix = '';
my $before = '';
my $after = '';

sub prefix {
    shift;
    $prefix = shift;
}

sub before {
    shift;
    $before = shift;
}

sub after {
    shift;
    $before = shift;
}

sub verboseSystem {
    my $command = shift;

    print "$before\n" if ($before);
    print $prefix . $command . "\n";
    my $ret = (system($command) == 0);
    print "$after\n" if ($after);
    return $ret;
}

sub vsys {
    verboseSystem(@_);
}

1;
