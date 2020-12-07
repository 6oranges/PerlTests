#Perl Pragmas
# this so that you can write better code
use strict;
use warnings;
use diagnostics;

my %north =  ( England => 'France',
	           France => 'England', 
    	           Spain => 'France', 
    	           China => 'New York', 
	           Germany => 'Germany');
# taking input from user
my $input = <STDIN>;
# remove trailing newline
chomp $input;
# a subroutine; paramaters are accessed through a global variable @_
sub Forward {
   $count = 0; # initial value

   print "Value of counter is $count\n";
   $count++;
}

for (1..5) {
   Forward();
}