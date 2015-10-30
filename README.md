# CIS6930-TINY-Testing-Scripts
A collection of .sh files to make testing the projects MUCH more convenient.

Overview:

The scripts' structure reflects my Cygwin/Netbeans development enviornment setup. For me:
1. Hitting the run button in netbeans launches Bootstrap.exe (not present)
2. Bootstrap.exe runs Tiny_Driver_Driver.sh, on a Cygwin shell
3. Tiny_Driver_Driver.sh then calls the desired project drivers
4. Project_X_Driver.sh then runs all the drivers for that project, and both logs & displays the result
  -- It imports helper functions from Driver_Functions.sh to do so

Comments:

Because I'm pathological about such things, the scripts are unusually well-factored and documented.
Unfortunately, the only further support I'm providing is this:
GLHF o7 :)

