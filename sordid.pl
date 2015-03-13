#!/usr/bin/perl
use v5.16;
use strict;
use Data::Dumper;

my @list = (
    {
	'id' => '1',
	'is_active' => 1,
	'description' => 'apple'
    },
    {
	'id' => '10',
	'description' => 'pear',
	'is_active' => 0
    },
    {
	'id' => '13',
	'is_active' => 1,
	'description' => 'banana'
    },
    {
	'id' => '16',
	'description' => 'asian pear',
	'is_active' => 1
    },
    );

my %scores = (
    'crunchy' => 1,
    'mushy' => 2,
    'blah'  => 3,
    'other'   => 4,
    );

sub _get_plant_family {
    my ( $description ) = @_;

    if ( $description =~ /apple/ ) {
	return 'crunchy';
    } elsif ( $description =~ /pear/ ) {
	return 'blah';
    } elsif ( $description =~ /banana/ ) {
	return 'mushy';
    } else {
	return 'other';
    }
}

my @result =
    map {$_->[1]} # return the top one
sort {$a->[0] <=> $b->[0]} # sort scores
map {[$scores{$_}, $_]} map {_get_plant_family($_)} map{$_->{description}} # map plant family to score
grep {$_->{is_active} == 1} # filter out active plants
@list;

say Dumper(\@result);
