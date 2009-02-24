package WebService::BaseClass::AbstractCacheManager;
use strict;
use Digest::MD5 qw(md5_hex);
use base qw(Class::Data::Inheritable Class::Accessor);
__PACKAGE__->mk_classdata('lifetime'=>81600);

sub new{
	my $class = shift;
	my $self = $class->SUPER::new();
	$self->init(@_);
	return $self;
}

sub init{
	my $self = shift;
}

sub store_cache{
	my $self   = shift;
	my $id     = shift;
	my $result = shift;
}

sub retrieve_cache{
	my $self    = shift;
	my $id     = shift;
}

sub is_cached{
	my $self = shift;
	my $id     = shift;
	return 0;
}

sub create_cache_id{
	my $self = shift;
	my $url  = shift;
	my $args = shift;
	my $auth = shift;
	my $id = $url;
	foreach my $key (keys %{$args}){
		$id .= $key.$args->{$key};
	}
	foreach my $key (keys %{$auth}){
		$id .= $key.$auth->{$key};
	}
	return md5_hex($id);
}


1; 
