package Daramen::Web::Contoller::Root;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    $self = shift;
    $self->render();
}

1;
