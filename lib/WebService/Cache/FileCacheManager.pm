package WebService::BaseClass::FileCacheManager;
use strict;
use Digest::MD5 qw(md5_hex);
use Storable qw(store retrieve);
use base qw(WebService::BaseClass::AbstractCacheManager);
__PACKAGE__->mk_classdata('cache_dir');


sub init{
	my $self = shift;
	my $cache_dir = shift;
	die "Require cache dirctory path " unless($cache_dir);
	$self->cache_dir($cache_dir);
	if(! -f $self->cache_dir){
		mkdir $self->cache_dir();
	}
}

sub store_cache{
	my $self   = shift;
	my $id     = shift;
	my $result = shift;
	store $result ,$self->cache_dir.$id;
}

sub retrieve_cache{
	my $self    = shift;
	my $id     = shift;
	retrieve $self->cache_dir.$id;
}

sub is_cached{
	my $self = shift;
	my $id     = shift;
	return 0 unless(-f $self->cache_dir .$id);
	my @file_status = stat($self->cache_dir .$id);
        return 0 if($self->life_time < (time - $file_status[9]));
	return 1;
}


1; 
