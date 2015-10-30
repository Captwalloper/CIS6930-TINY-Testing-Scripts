#CONFIG
tiny_directory=$"C:/cygwin64/usr/tws/tiny"
project="pr1"
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
    TimeoutTestHelper $seconds $*
}

Show_Expected_Results() { # Display a test's expected results for convenient comparison
    Show_Expected_Results_Helper $one_at_a_time "$1"
}

#SETUP
cd $tiny_directory
echo "|---$0---|"; 

rm $log_file # ensure log_file is regenerated each run

source Driver_Functions.sh # NOTE: if in doubt, use absolute filepath here (this is basically an import statement)

#CORRECT -13

Test c01; Show_Expected_Results -3
Test c02; Show_Expected_Results 3
Test c03; Show_Expected_Results 18
Test c04; Show_Expected_Results 1
Test c05; Show_Expected_Results 2
Test c06; Show_Expected_Results -1
Test c07; Show_Expected_Results 21
Test c08; Show_Expected_Results $"1\n0\n0\n1\n0\n1\n"
Instruct "TYPE 1, 2, 3, CTRL-d"; Test c09; Show_Expected_Results $"1\n2\n3\n3\n"
Test c10; Show_Expected_Results $"1\n0\n1\n1\n1\n1\n"
Test c11; Show_Expected_Results $"1000\n100\n200\n150\n3\n81\n"
Test c12; Show_Expected_Results $"45\n30\n6\n-3\n20\n0\n0\n1\n0\n"
Test c13; Show_Expected_Results -1

#INCORRECT -8

Test e01; Show_Expected_Results "Errors: variables not declared"
Test e02; Show_Expected_Results "Errors: variables not declared"
Test e03; Show_Expected_Results 'Errors: variables not declared'
Test e04; Show_Expected_Results 'Error: syntax error on line 6'
Test e05; Show_Expected_Results 'This program tests to see if booleans are typechecked. Constrainer errors should be produced.'
Instruct "TYPE 1, CTRL-d"; Test e06; Show_Expected_Results 'this program tests the eof built in function. error: incompatible types on while line11'
Test e07; Show_Expected_Results 'this program tests the equality/inequality operators. error:-^ incompatible types lines(19,22,25,28,31,34)'
Test e08; Show_Expected_Results 'this program tests the arithmetic operators. error: wrong type for operation lines(17,20,23,26)'

#AFTERMATH
printf "*******************************************************\n"
printf "The difference between this run and the golden run was:\n"
diff $log_file $golden_log_file

if $golden_run;
then # regenerate gold log file
   rm $golden_log_file
   cp -a $log_file $golden_log_file 
fi
