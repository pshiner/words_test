use strict;
use WordsTest;

=pod
This is a simple example that runs against the file `dictionary.txt`.

The file was found via `http://bit.ly/1jveLkY` redirected 
to `https://dl.dropboxusercontent.com/u/14065136/dictionary.txt`

=cut

my $wt = WordsTest->new();

# add in stuff, put the file loading code in the class once testing works
# obviously more stuff needs to go here for the demonstration

foreach my $w ( 'this', 'that', 'theater', 'theatrics' ) {
	$wt->load($w);	
}


my $wref = $wt->words();
my $sref = $wt->sequences();
while (my $w = shift(@{$wref})) {
	my $s = shift(@{$sref});
	print $s,"\t",$w,"\n";
}

exit(0);

### End of File