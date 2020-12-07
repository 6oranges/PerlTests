#Perl Pragmas
# this so that you can write better code
use strict;
use warnings;
use diagnostics;
no warnings 'experimental';
use feature 'say';
use feature 'switch';
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
               OtherRoom=>'OtherRoom'
               );
my $Direction='North';
my $Place="Start";
sub MakeMove {
    use feature 'switch';
    # taking input from user
    my $input = <STDIN>;
    # remove trailing newline
    chomp $input;
    given($input) {
        when( "forward" ){
            given($Direction) {
                when ("North"){
                    $Place=$north{$Place};
                }
                when ("South"){
                    $Place=$south{$Place};
                }
                when ("East"){
                    $Place=$east{$Place};
                }
                when ("West"){
                    $Place=$west{$Place};
                }
            }
        }
        when ("left") {
            given($Direction) {
                when ("North"){
                    $Direction="West";
                }
                when ("South"){
                    $Direction="East";
                }
                when ("East"){
                    $Direction="North";
                }
                when ("West"){
                    $Direction="South";
                }
            }
        }
        when ("right") {
            given($Direction) {
                when ("North"){
                    $Direction="East";
                }
                when ("South"){
                    $Direction="West";
                }
                when ("East"){
                    $Direction="South";
                }
                when ("West"){
                    $Direction="North";
                }
            }
        }
        default {
            print "Try again!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";
            MakeMove();
        }
    }
}
my $HaveTreat="No";
while (1){
    MakeMove();
    if ($Place=="DangerFish"){
        print "The fish is hungry and somehow you don't make it across the river\n";
        break;
    }
    if ($Place=="Dog" && $HaveTreat=="No"){
        print "The dog gets you...\n";
        break;
    }
}
