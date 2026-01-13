#!/bin/bash

NUMBER=$99

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER 99 -gt 10 ]
then
   echo "Given number $NUMBER is greater than 10"
else
   echo "Given number $NUMBER is not greater than 10"
fi