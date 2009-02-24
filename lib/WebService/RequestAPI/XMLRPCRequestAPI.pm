package WebService::RequestAPI::XMLRPCRequestAPI;
use strict;
use XMLRPC::Lite;
use JSON;
use utf8;
use base qw(WebService::RequestAPI::AbstractRequestAPI);


sub request{
	my $self = shift;
	my $url = shift;
	my $method = shift;
	my $args = shift;

	$self->result(XMLRPC::Lite->proxy($url)->call($method, $args)->result);

	return $self;
}

1; 
