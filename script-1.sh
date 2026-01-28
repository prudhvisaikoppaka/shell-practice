#!/bin/bash

GREETING="Hello, Good Morning"
echo "$GREETING"
echo "PID of SCRIPT-1: $$"

# ./script-2.sh # Here "." represents current directory

source ./script-2.sh 