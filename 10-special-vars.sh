#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of the user: $Home"
echo "User running this script: $USER"
echo "PID of the current script: $$"
Sleep 10 &
echo "PID of the last command running in background: $!"