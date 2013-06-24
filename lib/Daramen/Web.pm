package Daramen::Web;
use Mojo::Base 'Mojolicious';

sub startup {
    my $self = shift;
    my $r = $self->routes;
    $r->namespaces([qw/Daramen::Web::Controller/]);
    $r->get('/')->to('root#index');
}

1;
