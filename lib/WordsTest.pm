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

sub new {
	my $class = shift;
    my $self = { };
    bless $self, $class;
    return $self;
};

=pod
sub load (<list>);

This takes a list/reference/word and adds it to the dictionary.
Lets start with a scalar that is a word and generalize later.

=cut

sub load {
	my ($self,$parm) = @_;
	
	my $wval = $parm;		# so we can refactor into accepting more types, etc.
	
	my $wkey = lc($wval);								# index in lower case
	return(0) if (exists($self->{'-word'}->{$wkey}));	# we have seen this word already, 
	
	$self->{'-word'}->{$wkey} = $wval;					# add to list of words
	
	# loop through, 
	#	if a key exists but is undefined then we have already seen it more than once
	#	if a key exists but is defined then we have seen it exactly once so far
	#	if a key does not exist we have not yet seen the sequence yet, add it to the list
	
	for (my $i = 0; $i <= length($wval)-4; $i++) {  # <= to the length we are using
		my $sval = substr $wval,$i,4;
		my $skey = lc($sval);	# lower case indexing
		
		if (exists($self->{'-sequence'}->{$skey})) {
			$self->{'-sequence'}->{$skey} = undef;		# either way it is now > 1 occurance
		} else {
			$self->{'-sequence'}->{$skey} = { '-value' => $sval, '-word' => $wval };		# set the value portion to the original case of the letters, store word too
		}
	}
		
};


# get the list of sequences

sub sequences {
	my ($self) = @_;
	
	my @slst = ( );
	
	foreach my $k (sort(keys(%{$self->{'-sequence'}}))) {
		if (defined($self->{'-sequence'}->{$k})) {
			push(@slst,$self->{'-sequence'}->{$k}->{'-value'});		# note the '-value' here
		}
	}
	
	return(\@slst);
};


# get the list of words

# OK, this is copy and paste code as it is very small and simple.  The
# added complexity added by creating another function that pulls out
# either the sequence value or the corresponding word portion from
# the same basic structure seems  overly complex for this tiny amount of code.
# If it would be a bigger chunk of code then probably another 
# function would help ( be ok ).

sub words {		
	my ($self) = @_;
	
	my @slst = ( );
	
	foreach my $k (sort(keys(%{$self->{'-sequence'}}))) {
		if (defined($self->{'-sequence'}->{$k})) {
			push(@slst,$self->{'-sequence'}->{$k}->{'-word'});	# note the '-word' here
		}
	}
	
	return(\@slst);
};

1;
### End of File