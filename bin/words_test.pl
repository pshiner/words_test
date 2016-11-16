use strict;

use lib '../lib';
use WordsTest;

=pod
words_test.pl

This file takes a file from standard input and outputs
two files according to the specification.  One is 'sequences'
and the other is named 'words'.

=cut

my @word_list = ( );

while (<>) {
	chomp;
	push(@word_list,$_);
}

my $wt = WordsTest->new();

foreach my $w (@word_list) {
	$wt->load($w);	
}

my $wref = $wt->words();
open(FH,">words");
while (my $w = shift(@{$wref})) {
	print FH $w,"\n";
}
close(FH);

my $sref = $wt->sequences();
open(FH,">sequences");
while (my $s = shift(@{$sref})) {
	print FH $s,"\n";
}
close(FH);

exit(0);

### End of File