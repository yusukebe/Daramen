#!/usr/bin/env perl
use strict;
use warnings;
use Daramen::CLI::Crawler;
use AnyEvent;

my $cv = AnyEvent->condvar;
my $w; $w = AnyEvent->timer(
    after    => 0,
    interval => 60 * 10,
    cb       => sub {
        my $crawler = Daramen::CLI::Crawler->new;
        $crawler->run();
    }
);

$cv->recv;
