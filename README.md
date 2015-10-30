# CIS6930-TINY-Testing-Scripts
A collection of .sh files to make testing the projects MUCH more convenient.

Overview:

The scripts' structure reflects my Cygwin/Netbeans development enviornment setup. For me: <br />
1. Hitting the run button in netbeans launches Bootstrap.exe (not present) <br />
2. Bootstrap.exe runs Tiny_Driver_Driver.sh, on a Cygwin shell <br />
3. Tiny_Driver_Driver.sh then calls the desired project drivers <br />
4. Project_X_Driver.sh then runs all the drivers for that project, and both logs & displays the result <br />
-- It imports helper functions from Driver_Functions.sh to do so <br />

Use:

The top of each script contains its configuration settings. These may include: <br />
-- path/directory variables (edit these to match your personal setup) <br />
-- one_at_a_time (boolean; determines whether or not the driver pauses between tests) <br />
-- and golden_run (boolean), which requires some elaboration... <br />

Each Project Driver produces a file called prX_log_file.txt. This log file is appended with each call <br />
to the Test function, and is regenerated each Project Driver run.  <br />

If golden_run is set to true, the old golden_prX_log_file.txt is overriden with a copy of the most recent  <br />
Project Driver run's log file. Set golden_run to true for 1 Project Driver run once you're confident all tests are passing. 

At the end of each Project Driver run, the diff command is run on the normal and gold log files.  <br />
If the golden_log is correct and the log file doesn't match it, regression occurred. <br />

Comments:

Because I'm pathological about such things, the scripts are unusually well-factored and documented. <br />
Unfortunately, the only further support I'm providing is this: <br />
GLHF o7 :)

