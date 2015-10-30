#CONFIG
one_at_a_time=true # pause until "enter" hit between drivers
directory_of_drivers=$"C:/cygwin64/usr/tws/tiny/tests"

#FUNCTIONS
Launch() { # Run the specified Driver
    cd $directory_of_drivers
    ./$1
    printf $"\n""$1 Run Complete!""\n"
    if $one_at_a_time; then
        read -p "Press enter to continue..."
    fi
}

#SETUP
printf $"Running $0 ...""\n\n"

#Project 1
Launch Project_1_Driver.sh

#Project 2
Launch Project_2_Driver.sh

#Project 3
Launch Project_3_Driver.sh





#SCRAP
# tr -d '\r' < C:/cygwin64/usr/tws/tiny/strap.sh > C:/cygwin64/usr/tws/tiny/strap2.sh