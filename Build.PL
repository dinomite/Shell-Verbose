use Module::Build;
my $build = Module::Build->new(
    module_name     => 'Shell::Verbose',
    license         => 'perl',
    dist_author     => 'Drew Stephens <drew@dinomite.net>',
    dist_abstract   => 'A verbose version of system()',
    create_readme   => 1,
    create_license  => 1,
    requires        => {
        'perl'          => '5.8.8',
    },
    build_requires  => {
        'Capture::Tiny' => '0.06',
    },
);
$build->create_build_script;
