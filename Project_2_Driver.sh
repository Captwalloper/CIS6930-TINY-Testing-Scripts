#CONFIG
tiny_directory=$"C:/cygwin64/usr/tws/tiny"
project="pr2"
log_file=$project"_log_file"".txt"
golden_log_file="golden_"$log_file

one_at_a_time=false # pause between tests
golden_run=false # declare this run as the gospel against which to run regression tests

#FUNCTIONS
Log() { # In addition to sending stdout to console, append it to the logfile.
    Log_Helper $log_file
}

Instruct() { # Provide a reminder about what input/behavior is expected for a test.
    Instruct_Helper $1
}

Test() { # Compile and run the specified program; pass along any additional parameters; log everything 
    Test_Helper $* | Log
}

TimeoutTest() { # Same as test, but timeout after a few seconds
    seconds=3;
    TimeoutTest_Helper $seconds $*
}

Show_Expected_Results() { # Display a test's expected results for convenient comparison
    Show_Expected_Results_Helper $one_at_a_time "$1"
}

#SETUP
cd $tiny_directory
echo "|---$0---|";

rm $log_file # ensure log_file is regenerated each run

source Driver_Functions.sh # NOTE: if in doubt, use absolute filepath here

#CORRECT -16

#pass
Test c01; Show_Expected_Results $"5 6\n6 5\n1 1\n5  \n2 4\n10  \n3 9\n15  \n4 16\n20"
Test c02 0 0; Show_Expected_Results $"6 0 0\n0 0 0"
Test c03 2 5 10; Show_Expected_Results $"2\n999"
Test c04; Show_Expected_Results $"888\n999\n""5,1 to 5,5\n""4,1 to 4,4\n""3\n2\n1\n888"
Test c05 10 50 70 100; Show_Expected_Results $"15\n999\n71"
Test c06 1 11 999; Show_Expected_Results $"2 to 11"
Test c07; Show_Expected_Results $"3 2 1"
Test c08; Show_Expected_Results $"1\n2\n3\n4\n5"
Test c09; Show_Expected_Results $"1\n2\n3"
Test c10; Show_Expected_Results $"1\n2\n3\n4\n5"
Test c11; Show_Expected_Results $"1\n2"
Test c12; Show_Expected_Results $"1 2"
Test c13; Show_Expected_Results $"100 100 1"
Test c14 42 100 1; Show_Expected_Results $"42\n100\n"
Test c15; Show_Expected_Results $"888\n1\n2\n3\n""4,1 to 4,4\n""5,1 to 5,5\n""999\n888"
Test c16; Show_Expected_Results $"0\n1"

#fail

#ERROR -13

#pass
Test e01; Show_Expected_Results $"error: for loop variable doesn't match the start value"
Test e02; Show_Expected_Results $"error: repeat expression not boolean"
Test e03; Show_Expected_Results $"error: swap with a integer (actually gives parse error)"
Test e04; Show_Expected_Results $"error: case variable and label mismatch (codegen may fail)" 
Test e05; Show_Expected_Results $"Can't re-use loop control variable. (codegen may fail)"
Test e06; Show_Expected_Results $"# two errors: can't assign to loop control variable"
Test e07; Show_Expected_Results $"error: Can't exit from for loop"
Test e08; Show_Expected_Results $"error: wrong context for exit: not inside a loop statement"
Test e09 11; Show_Expected_Results $"error: can't exit from a for loop."
TimeoutTest e10; Show_Expected_Results $"Two errors: Can't swap with loop control variable" 
Test e11; Show_Expected_Results $"error: no exit from outer loop"
Test e12; Show_Expected_Results $"error: Can't re-use loop control variable.\nerror: Can't exit from for loop" 
Test e13; Show_Expected_Results $"error: Cannot exit from a for statement"

#fail

#AFTERMATH
printf "*******************************************************\n"
printf "The difference between this run and the golden run was:\n"
diff $log_file $golden_log_file

if $golden_run;
then # regenerate gold log file
   rm $golden_log_file
   cp -a $log_file $golden_log_file 
fi
