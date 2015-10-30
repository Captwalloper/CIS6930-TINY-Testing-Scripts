#CONFIG
tiny_directory=$"C:/cygwin64/usr/tws/tiny"
project="pr3"
log_file=$project"_log_file"".txt"
golden_log_file="golden_"$log_file

one_at_a_time=false # pause between tests
golden_run=false # declare this run as the gospel against which to run regression tests
run_diff=false # compare most recent log to golden log

#FUNCTIONS
Log() { # In addition to sending stdout to console, append it to the logfile.
    Log_Helper $log_file
}

Instruct() { # Provide a reminder about what input/behavior is expected for a test.
    Instruct_Helper "$1"
}

Test() { # Compile and run the specified program; pass along any additional parameters; log everything 
    Test_Helper $* | Log
}

TimeoutTest() { # Same as test, but timeout after a few seconds
    seconds=3;
    TimeoutTestHelper $seconds $*
}

Show_Expected_Results() { # Display a test's expected results for convenient comparison
    Show_Expected_Results_Helper $one_at_a_time "$1"
}

#SETUP
cd $tiny_directory
echo "|---$0---|"; 

rm $log_file # ensure log_file is regenerated each run

source Driver_Functions.sh # NOTE: if in doubt, use absolute filepath here

#CORRECT -53

#pass

#fail
Test c01; Show_Expected_Results $"1 10\n2 9\n3 8\n4 7\n5 6\n6 5\n7 4\n8 3\n9 2\n10 1"
Test c02; Show_Expected_Results $"98 b"
Test c03 1 2 3 4 a b c; Show_Expected_Results $"4 1 a 3 c 2 b\n3 1 a 3 c 2 b\n2 1 a 3 c 2 b\n1 1 a 3 c 2 b\n0 1 a 3 c 2 b"
Test c04; Show_Expected_Results $"A 65\nB 66\nC 67\nD 68\nE 69\nF 70\na 97\nb 98\nc 99\nd 100\ne 101\nf 102"
Test c05; Show_Expected_Results $"1 -1 U\n2 0 V\n3 1 W\n4 2 X\n5 3 Y\n6 4 Z\n7 5 [\n8 6 \\n9 7 ]"
Test c06; Show_Expected_Results $"4\n3\n2\n1\n0\n255\n254\n253\n252"
Test c07; Show_Expected_Results $"999\n777"
Test c08 999 999 999; Show_Expected_Results $"WTF!?"
Test c09; Show_Expected_Results $"3\n2\n1\n0"
Test c10; Show_Expected_Results $"3\n2\n1"
Test c11; Show_Expected_Results $"0\n2"
Test c12; Show_Expected_Results $"1\n2\n3\n4\n5"
Test c13; Show_Expected_Results $"1\n2\n3"
Test c14; Show_Expected_Results $"0\n1\n2\n3\n4"
Test c15; Show_Expected_Results $"5\n4\n3\n2\n1"
Test c16; Show_Expected_Results $"aA\nbB\ncC\ndD\neE\nfF"
Test c17; Show_Expected_Results $"4 1"
Test c18; Show_Expected_Results $"1 0\n1 1\n1 2\n2 0\n2 1\n2 2"
Test c19; Show_Expected_Results $"1\n2\n3"
Test c20; Show_Expected_Results $"Ascii Table from 'A' to 'F'\nascii code and character: 65 A\nascii code and character: 66 B\nascii code and character: 67 C\nascii code and character: 68 D\nascii code and character: 69 E\nascii code and character: 70 F"
Test c21; Show_Expected_Results $"33\n22\n57"
Test c22 a 1 b 2 c 3; Show_Expected_Results $"???"
Test c23; Show_Expected_Results $"5 55 55 5"
Test c24; Show_Expected_Results $"117 127 20u\n118 245 21v\n119 364 22w\n120 484 23x\n121 605 24y\n122 727 25z"
Test c25; Show_Expected_Results $"character = a\ncharacter = b\ncharacter = c"
Test c26; Show_Expected_Results $"Big is 1000\nSmall is 10\nchr(65) = A"
Test c27; Show_Expected_Results $"1 5\n2 8\n3 11"
Test c28; Show_Expected_Results $"Nulls test."
Test c29; Show_Expected_Results $"b is not an a"
Test c30; Show_Expected_Results $"A 1\n B2\n...\nZ 26\na 1\nb 2\n...\nz 26"
Test c31; Show_Expected_Results $"100 ac98"
Test c32; Show_Expected_Results $"Bo knows Footbal.\nBo knows Baseball.\nbut...\nBo don't know Translators."
Test c33 b; Show_Expected_Results $"Letter => b\nLetter => c\nLetter => d\nLetter => e\nLetter => f\nLetter => g\nLetter => h\nLetter => i\nLetter => j\nLetter => k\nYAHOO! ... aw PHOOEY!, I am through."
Test c34 ??? ???; Show_Expected_Results $"???"
Test c35; Show_Expected_Results $"9 10 11\n8 9 10\n7 8 9\n6 7 8\n5 6 7\n4 5 6\n3 4 5\n2 3 4\n1 2 3\n0 1 2\n-1 0 1"
Test c36; Show_Expected_Results $"k = 1\nl = 1\nc\nb\na"
Test c37; Show_Expected_Results $"1\n1\n1"
Test c38; Show_Expected_Results $"This is Mark and Sunjay's test program."
Test c39 0; Show_Expected_Results $"w"
Test c40; Show_Expected_Results $"50 51"
Test c41; Show_Expected_Results $"3\n2\n1"
Test c42; Show_Expected_Results $"3\n2\n1\n0"
Test c43; Show_Expected_Results $"1\n2\n3\n4\n5"
Test c44; Show_Expected_Results $"1\n2\n3"
Test c45; Show_Expected_Results $"0\n1\n2\n3\n4"
Test c46; Show_Expected_Results $"0\n1\n2\n3"
Test c47; Show_Expected_Results $"aA\nbB\ncC\ndD\neE\nfF"
Test c48; Show_Expected_Results $"4 1"
Test c49; Show_Expected_Results $"1 0\n1 1\n1 2\n2 0\n2 1\n2 2"
Test c50; Show_Expected_Results $"1\n2\n3\n4\n5\n6\n2\n3\n4\n5"
Test c51; Show_Expected_Results $"y\nt\n!"
Test c52; Show_Expected_Results $"3\n4\n2"
Test c53; Show_Expected_Results $"1\n2\n3\n4\n5\n6\n2\n3\n4\n5"

#ERROR -27

#pass

#fail
Test e01; Show_Expected_Results $"c := three    : assignment types do not match\nx := c : assignment types do not match\nc := chr(a)    : argument of chr must be of type integer"
Test e02; Show_Expected_Results $"Codegenerator dies violently... ord should accept boolean values but chr should not accept boolean values"
Test e03; Show_Expected_Results $"type clash\ncan't swap a constant\ntype clash"
Test e04; Show_Expected_Results $"ERROR : constants can't be assigned a type\nERROR : Types do not match\nERROR : characters can not be added to each other"
Test e05; Show_Expected_Results $"case label type does not match case expression type\ncase label must be const or lit"
Test e06; Show_Expected_Results $"argument of chr must be of type integer\nincompatible types -- can't add chars to integers"
Test e07 1 2 3 4 5; Show_Expected_Results $"error:  can't read in a FOR loop control variable"
Test e08; Show_Expected_Results $"error - type mismatch in assignment\nerror - can't assign to a constant"
Test e09; Show_Expected_Results $"`*` requires two integers... c is not an integer, neither is succ(c)\nAssignment types don't match... neither f nor pred(f) is an integer\n`or` requires two boolean expressions... neither a nor succ(a) is boolean"
Test e10; Show_Expected_Results $"argument og chr must be of type integer\ncan't output boolean type"
Test e11; Show_Expected_Results $"Undeclared Identifier  foo\nCHR of boolean\nNOT of char type"
Test e12; Show_Expected_Results $"ERROR => trying to assign an int value to a variable of type 'char'.\nERROR => trying to assign an char value to a variable of type 'int'.\nERROR => trying to assign a value to a constant."
Test e13 5; Show_Expected_Results $"Will complain here about swapping with a constant\nWill complain here about chr of a boolean" 
Test e14; Show_Expected_Results $"cannot take the 'chr' of a boolean\ncannot take the 'chr' of a character"
Test e15; Show_Expected_Results $"type must be the same\nassigning to a control variable"
Test e16; Show_Expected_Results $"error 1:  Range specifiers must be of the same type.\nerror 2:  Constant value cannot be changed."
Test e17; Show_Expected_Results $"error-- the character is not enclosed in quotes"
Test e18; Show_Expected_Results $"identifier m is undeclared\nidentifier k is already declared \nerror in output !! single quotes for strings"
Test e19; Show_Expected_Results $"ERROR: attempted assignment to a constant"
Test e20; Show_Expected_Results $"error: redeclares three"
Test e21; Show_Expected_Results $"error: redeclared number"
Test e22; Show_Expected_Results $"error: redeclared three as a type"
Test e23; Show_Expected_Results $"error: can't compare integer and number\ncan't output boolean type"
Test e24; Show_Expected_Results $"error: can't compare number and weekday."
Test e25; Show_Expected_Results $"error:	can't output an enumerated value"
Test e26; Show_Expected_Results $"error: type of loop control variable doesn't match the type of start expression\noutput of enumerated type."
Test e27; Show_Expected_Results $"error: can't swap with a literal.\ncan't output an ennumerated type."

#AFTERMATH
if $run_diff
then
    printf "*******************************************************\n"
    printf "The difference between this run and the golden run was:\n"
    diff $log_file $golden_log_file
fi

if $golden_run;
then # regenerate gold log file
   rm $golden_log_file
   cp -a $log_file $golden_log_file 
fi