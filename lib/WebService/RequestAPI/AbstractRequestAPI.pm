package WebService::RequestAPI::AbstractRequestAPI;
use strict;
use utf8;
use JSON;
use XML::Simple;
use base qw(Class::Data::Inheritable Class::Accessor);
__PACKAGE__->mk_accessors(qw/result/);

sub new{
	my $class = shift;
	my $self = $class->SUPER::new();
	$self->init(@_);
	return $self;
}


sub init{
	my $self = shift;
	my $cache_manager = shift;
}

sub parse_json{
	my $self   = shift;
	return  decode_json($self->result);
}

sub parse_xml{
	my $self    = shift;
	return  XML::Simple->new()->XMLin($self->result);
}



sub request{
	my $self   = shift;
	return $self;
}

1; 
