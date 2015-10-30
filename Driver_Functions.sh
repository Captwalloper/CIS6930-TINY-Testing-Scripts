# Contains all common functions among drivers

# USE: command | Log_Helper logfile
# Example: printf "****" | Log_Helper "pr1_log_file.txt"
Log_Helper() { # In addition to sending stdout to console, append it to the logfile.
    while read data; 
    do echo "$data" | tee -a $1; 
    done;
}

# USE: Instruct_Helper message
# Example: Instruct_Helper "TYPE 1, CTRL-d"
Instruct_Helper() { # Provide a reminder about what input/behavior is expected for a test.
    printf "*********************************************""\n"
    printf "$1""\n"
}

# USE: Test_Helper programName programParam1 programParam2 ...
# Example: Test_Helper c01
# Example: Test_Helper c02 0 0
Test_Helper() { # Compile and run the specified program; pass along any additional parameters; log everything 
    printf "*********************************************""\n"  
    printf "$project"".""$1""\n"                                
    printf "*********************************************""\n"  
    echo "${@:2}" | ./tc tests/$project.$1                      
}

# USE: TimeoutTest_Helper seconds programName programParam1 programParam2 ...
# Example: TimeoutTest_Helper seconds c01
# Example: TimeoutTest_Helper seconds c02 0 0
TimeoutTest_Helper() { # Same as test, but timeout after a few seconds
    timeout $1"s" cat <( Test ${@:2} )
}

# USE: Show_Expected_Results_Helper boolean message
# Example: Show_Expected_Results_Helper true $"1\n0\n0\n1\n0\n1\n"
Show_Expected_Results_Helper() { # Display a test's expected results for convenient comparison
    printf $"EXPECTED RESULTS:""\n"
    if [[ $2 =~ ^[\-0-9]+$ ]] && (( $2 < 0)); # need to print negative number
    then
        echo "$2"
    else
        printf "$2"
    fi
    printf "\n"

    if $1; then
        read -p "Press enter to continue..."
    fi
}
