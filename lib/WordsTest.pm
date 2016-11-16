package WordsTest;

=pod

So this is a class that is a dictionary.  It has simple methods to load
values from a list of words and pull the sequences and word list back out.

Uses references to the lists.

Example:

use WordsTest;

my $dl = [ 'this', 'that', 'theater', 'theatrical' ];

my $wt = WordsTest->new()

$wt->load($dl);				# load the dictionary words

my $sl = $wt->sequences();	# return a reference to a list of sequences
foreach my $e (@{$sl}) { print $e,"\n"; }

my $wl = $wt->words();		# return a reference to a list of words
foreach $e (@{$sl}) { print $e,"\n"; }


=cut

sub new {};			# create a new dictionary
sub load {};		# load a dictionary from a list of words ( duplicates ignored )
sub sequences {};	# get the list of sequences
sub words {};		# get the list of words

1;
### End of File