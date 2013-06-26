package Daramen::Web::Controller::Root;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;
    my $page = $self->req->param('page') || 1;
    my ( $entries, $pager ) = $self->db->search_with_pager( 'entry', {},
        { order_by => 'id DESC', page => $page, rows => 20 } );
    $self->stash->{entries} = $entries;
    $self->stash->{pager} = $pager;
    $self->render();
}

1;
