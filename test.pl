# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Tk::CheckbuttonGroup;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my($top) = MainWindow->new();
my @selected = qw(two four);
my $checkbuttongroup = $top->CheckbuttonGroup (
	-list => [qw( one two three four five )],
	-orientation => 'vertical',
	-variable => \@selected,
	-command => sub {
		print @selected, "\n";
	}
)->pack();
$top->update();
print "ok 2\n";
sleep(1);
$checkbuttongroup->configure(
	-list => [qw( two three four five six seven )],
	-orientation => 'horizontal',
);
$top->update();
print "ok 3\n";
sleep(1);
$checkbuttongroup->configure(
	-variable => [qw(three seven eight)]
);
$top->update();
print "ok 4\n";
sleep(1);
$checkbuttongroup->configure(
	-font => 24
);
$top->update();
print "ok 5\n";
sleep(1);
$top->destroy();
print "ok 6\n";


