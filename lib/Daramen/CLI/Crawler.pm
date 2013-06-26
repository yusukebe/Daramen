package Daramen::CLI::Crawler;
use Mouse;
use Daramen;
use Daramen::DB;
use Net::Twitter::Lite::WithAPIv1_1;
use Try::Tiny;
use utf8;

has 'nt' => ( is => 'ro', lazy_build => 1 );
has 'query' => ( is => 'ro', isa => 'Str', default => sub { 'ラーメン pic.twitter.com' } );

sub _build_nt {
    my $config = Daramen->config();
    return Net::Twitter::Lite::WithAPIv1_1->new(
        %{$config->{twitter}}
    );
}

sub run {
    my $self = shift;
<<<<<<< HEAD
    my $result = $self->nt->search({ q => $self->query, 
                                      include_entities => 1,
                                      result_type      => 'recent',
                                      count            => 100
                                  });
    my $db = Daramen::DB->new({ connect_info => Daramen->config->{connect_info} });
    for my $tweet (@{$result->{statuses}}){
        
=======
    $self->crawl();
}

sub crawl {
    my $self = shift;
    my $result = $self->nt->search(
        {
            q                => $self->query,
            include_entities => 1,
            result_type      => 'recent',
            count            => 100
        }
    );
    my $db = Daramen::DB->new({ connect_info => Daramen->config->{connect_info} });
    for my $tweet (@{$result->{statuses}}) {

>>>>>>> finished
        next if $tweet->{retweeted};
        next unless $tweet->{entities}{media}[0];

        my $id = $tweet->{id};
        my $image_url = $tweet->{entities}{media}[0]{media_url};

        next if $db->single('entry', { id => $id });
<<<<<<< HEAD
        next if $db->single('entry', { image_url => $image_url });
=======
        next if $db->single('entry', { id => $image_url });
>>>>>>> finished

        my $text = $tweet->{text};
        my $user_id = $tweet->{user}{id};
        my $screen_name = $tweet->{user}{screen_name};
        my $created_at = $tweet->{created_at};
<<<<<<< HEAD

=======
        
>>>>>>> finished
        my $entry;
        try {
            $entry = $db->insert('entry',{
                id => $id,
                text => $text,
                user_id => $user_id,
                screen_name => $screen_name,
                image_url => $image_url,
                created_at => $created_at,
            });
        };
        warn "Entry: " . $entry->id . " is created!\n" if $entry;
    }
}

__PACKAGE__->meta->make_immutable();
1;
