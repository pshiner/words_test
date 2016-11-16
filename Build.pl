use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'WordsTest',
    license             => 'perl',
    dist_author         => 'Peter Shiner <peter.shiner@gmail.com>',
    dist_version_from   => 'lib/WordsTest.pm',
    dist_abstract		=> 'A sample programming excersize.',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Extra-Cleanup-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();