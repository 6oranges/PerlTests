#Perl Pragmas
# this so that you can write better code
use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';
# comments

# need ; to end a line
# print does not add a newline automatically1
print "Hello World\n";

#scalar
my $name = 'Andrew';

my ($age,$street) = (40,'123 Main St');

my $my_info = "$name lives on \"$street\"\n";
my $my_info2 = qq{$name is "$age"};

print $my_info, $my_info2, "\n";

#say $my_info2;
#Mat Operations
say "5 + 4 = ", 5 + 4;
say "5 - 4 = ", 5 - 4;
say "5 * 4 = ", 5 * 4;
say "5 / 4 = ", 5 / 4;
say "5 % 4 = ", 5 % 4;
say "5 ** 4 = ", 5 ** 4;


# Built in functions
# Includes Trig functions plus
say "EXP 1 = ", exp 1; # e to the power of
say "HEX 10 = ", hex 10; # Convert from hexidecimal
say "OCT 10 = ", oct 10; # Convert from Octal
say "INT 6.45 = ", int(6.45); # Truncate You can use parentheses
say "LOG 2 = ", log 2; # Number to the power of e
say "Random between 0 - 10 = ", int(rand 11);
say "SQRT 9 = ", sqrt 9;

#create random number
my $rand_num = int(rand 11);
say "Random Number 1 - 10", $rand_num;



