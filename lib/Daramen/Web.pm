package Daramen::Web;
use Mojo::Base 'Mojolicious';
use Daramen;
use Daramen::DB;

sub startup {
    my $self = shift;

    $self->helper(
        db => sub {
            Daramen::DB->new({ connect_info => Daramen->config->{connect_info}
                           });
        }
    );

    my $r = $self->routes;
    $r->namespaces([qw/Daramen::Web::Controller/]);
    $r->get('/')->to('root#index');
}

1;
