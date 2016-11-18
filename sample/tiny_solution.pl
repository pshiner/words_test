# File: tiny_solution.pl
# Desc: This is a small solution to the words_test problem, just for fun.

my $data = { };
while (<>) {
	chomp;
	my $w = $_;
	for (my $i = 0; $i <= length($w) - 4; $i++) {
		my $s = substr($w,$i,4);
		my $lcs = lc($s);
		if (exists($data->{$lcs})) { $data->{$lcs} = undef; next; }
		$data->{$lcs} = join("|",$s,$w);
	}
}

open(SFH,">sequences");
open(WFH,">words");
map { if (defined($data->{$_})) { my ($s,$w) = split(/\|/, $data->{$_}); print SFH $s,"\n"; print WFH $w,"\n"; } } sort(keys($data));
close(WFH);
close(SFH);


=pod

Assumptions:
* case matters in the output but not in the comparisons
* numbers are considered letters for the sequences
* the input data does not have invalid characters and is one word per line
* using a command of the format 'wget <url> -O - | perl -w tiny_solution.pl' you can get the output files directly from the download site and into the two files in one command line.
* the output files end in a trailing "\n" character
* just wanted to do this with a map
* just tested on the 1st test sample so this not as validated but the logic is simple
* still doing this under windows and so didn't do the fancy single line invocation as describe just above
* didn't put in the 'she-bang' syntax for bash/tcsh/sh to find and run perl auto-magically

=cut

### End of File