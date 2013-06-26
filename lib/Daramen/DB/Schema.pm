package Daramen::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
use DateTime;
use DateTime::Format::Strptime;
use DateTime::Format::MySQL;
use Encode;

table {
    name 'entry';
    pk 'id';
    columns qw/id text user_id screen_name image_url created_at/;
    inflate qr/.+_at$/ => sub {
        my ($value) = @_;
        my $dt = DateTime::Format::Strptime->new(
            pattern   => '%Y-%m-%d %H:%M:%S',
            time_zone => 'Asia/Tokyo',
        )->parse_datetime($value);
        return DateTime->from_object( object => $dt );
    };
    inflate qr/^text$/ => sub {
        my ($value) = @_;
        decode_utf8($value);
    };
    deflate qr/.+_at$/ => sub {
        my ($value) = @_;
        my $dt = DateTime::Format::Strptime->new(
            pattern => '%A %B %d %T %z %Y',
            time_zone => 'Asia/Tokyo',
        )->parse_datetime($value);
        return DateTime::Format::MySQL->format_datetime($dt);
    };
};

1;
