use strict;
use Test::More tests => 2;

use WordsTest;

sub _read_list {
	my ($fn) = @_;
	
	my @l = ( );
	open FH, "<$fn";
	while (<FH>) {
		chomp; # windoze
		push(@l,$_);
	}
	
	return(\@l);
}

sub check_set {
	my $i = sprintf("%02i",shift);
	
	my $dl = _read_list($i.'_dictionary.txt');
	my $sl = _read_list($i.'_sequences.txt');
	my $wl = _read_list($i.'_words.txt');
	
	my $wt = WordsTest->new();
	foreach my $w (@{$wl}) {
		$wt->load($w);	
	}
	
	
	return(1);
}



ok(check_set(0),'example from requirement');
ok(check_set(1),'going to the theater');

done_testing( 2 );

### End of File