#!/usr/bin/perl
use strict;
use Mojo::Server::PSGI;
use FindBin;
use lib "$FindBin::Bin/lib";
use Plack::Builder;
use Daramen::Web;

my $psgi = Mojo::Server::PSGI->new( app => Daramen::Web->new() );
my $app = sub { $psgi->run(@_) };
$app;


