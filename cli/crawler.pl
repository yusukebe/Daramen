#!/usr/bin/env perl
use strict;
use warnings;
use Daramen::CLI::Crawler;

my $crawler = Daramen::CLI::Crawler->new;
$crawler->run();
