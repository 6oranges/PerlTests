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
    	       Treat => 'EmptyPlace', 
	           EmptyPlace => 'Bridge',
               Bridge => 'Path',
               Path => 'Corridor',
               Corridor=>'Corridor',
               Note=>'Note',
               Gold=>'Gold',
               OtherRoom=>'OtherRoom'
               );
my %east =  ( Start => 'Treat',
	           Dog => 'EmptyPlace',
	           EmptyPlace => 'Cliff',
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
	           EmptyPlace => 'Dog',
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
	           EmptyPlace => 'Treat',
               Treat => 'Treat',
               Bridge => 'EmptyPlace',
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
            print "Try again!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
            MakeMove();
        }
    }
}
my $HaveTreat="No";
my $HaveKey="No";
while (1){
    MakeMove();
    if ($Place eq "DangerFish"){
        print "The fish is hungry and somehow you don't make it across the river\n";
        last;
    }
    if ($Place eq "Treat"){
        print "You Pick Up a Dog Treat.\n";
        $HaveTreat = "Yes";
    }
    if ($Place eq "Dog" && $HaveTreat eq "No"){
        print "The dog gets you...\n";
        last;
    }
    if ($Place eq "Dog" && $HaveTreat eq "Yes"){
        print "You feed the dog a treat, and pick up the key.\n";
        $HaveKey = "Yes";
    }
    if ($Place eq "Cliff"){
        print "You fell off the cliff.\n";
        last;
    }
    if ($Place eq "EmptyPlace" && $HaveKey eq "No"){
        print "You are located South of the Bridge\n";
        
    }
    if ($Place eq "Bridge" && $HaveKey eq "No"){
        print "The bridge is locked and needs a key, Find the Dog!\n";
        $Place = "EmptyPlace";
    }

}
