package WebService::Class::Delicious;
use strict;
use utf8;
use base qw(WebService::Class::AbstractHTTPRequestClass);
__PACKAGE__->base_url('https://api.del.icio.us/v1/');


sub posts_all{
	my $self = shift;
	my $auth = shift;
	$self->request_api()->request('GET',$self->base_url.'posts/all',{},$auth)->parse_xml();
}

sub tags{
	my $self = shift;
	my $auth = shift;
	$self->request_api()->request('GET',$self->base_url.'tags/get',{},$auth)->parse_xml();
}

sub tags_bundles_all{
	my $self = shift;
	my $auth = shift;
	$self->request_api()->request('GET',$self->base_url.'tags/bundles/all',{},$auth)->parse_xml();
}

sub set_tags_bundles{
	my $self = shift;
	my $auth = shift;
	my $bundle = shift;
	my $tags   = shift;
	$self->request_api()->request('GET',$self->base_url.'tags/bundles/set',{
				bundle=>$bundle,
				tags=>join('+',@$tags)
	},$auth)->parse_xml();
}

sub delete_tags_bundles{
	my $self = shift;
	my $auth = shift;
	my $bundle = shift;
	$self->request_api()->request('GET',$self->base_url.'tags/bundles/delete',{
				bundle=>$bundle,
	},$auth)->parse_xml();
}

1;
