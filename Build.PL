use Module::Build;
my $build = Module::Build->new(
    module_name => 'Shell::Verbose',
    license     => 'perl',
    dist_author => 'Drew Stephens <drew@dinomite.net>',
    dist_abstract => 'A verbose version of system()',
    requires    => {
        'perl'          => '5.8.8',
    },
);
$build->create_build_script;
