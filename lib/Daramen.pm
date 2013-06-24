package Daramen;
use strict;
use warnings;
use File::Spec;

our $VERSION = 'v0.1';

sub config {
    my $mode = $ENV{PLACK_ENV} || 'development';
    my $fname = File::Spec->catfile( KakaoBBS->base_dir(), 'config' ,  $mode . '.pl' );
    my $config = undef;
    if( -f $fname ){
        $config = do $fname or die "Cannnot load configuration file: $fname";
    }
    return $config;
}

sub base_dir {
    my $path = ref $_[0] || $_[0];
    $path =~ s!::!/!g;
    if ( my $libpath = $INC{"$path.pm"} ) {
        $libpath =~ s!(?:blib/)?lib/+$path\.pm$!!;
        File::Spec->rel2abs( $libpath || './' );
    }
    else {
        File::Spec->rel2abs('./');
    }
}

1;
