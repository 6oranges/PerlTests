#Perl Pragmas
# this so that you can write better code
use strict;
use warnings;
use diagnostics;
use feature 'say';
my %north =  ( Start => 'Dog',
	           Dog => 'DangerFish',
    	       Treat => 'Place', 
	           Place => 'Bridge',
               Bridge => 'Path',
               Path => 'Corridor',
               Corridor=>'Corridor',
               Note=>'Note',
               Gold=>'Gold',
               OtherRoom=>'OtherRoom'
               );
my %east =  ( Start => 'Treat',
	           Dog => 'Place',
	           Place => 'Cliff',
               Treat => 'Cliff',
               Bridge => 'Cliff',
               Note =>'Path',
               Path=>'Cliff',
               Gold=>'Corridor',
               Corridor=>'OtherRoom',
               OtherRoom=>'OtherRoom'
               );
my %west =  ( Start => 'Start',
	           Dog => 'Dog',
	           Place => 'Dog',
               Treat => 'Start',
               Bridge => 'DangerFish',
               Path =>'Note',
               Note=>'Note',
               Gold=>'Gold',
               Corridor=>'Gold',
               OtherRoom=>'Corridor'
               );
my %south =  ( Start => 'Start',
	           Dog => 'Start',
	           Place => 'Treat',
               Treat => 'Treat',
               Bridge => 'Place',
               Path =>'Bridge',
               Note=>'DangerFish',
               Gold=>'Gold',
               Corridor=>'Path',
               OtherRoom=>'Corridor'
               );
# taking input from user
my $input = <STDIN>;
# remove trailing newline
chomp $input;
# a subroutine; paramaters are accessed through a global variable @_
sub Forward {
   my $count = 0; # initial value

   print "Value of counter is $count\n";
   $count++;
}

for (1..5) {
   Forward();
}