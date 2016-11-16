use strict;
use Test::More;

use WordsTest;


sub check_set {
	my $i = shift;
	
	my $wt = WordsTest->new();
	$wt->load();
	...
}



ok(check_set(0));

### End of File