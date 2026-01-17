#!/bin/bash

NUMBER=$99

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER -gt 90 ]
then
   echo "Given number $NUMBER is greater than 90"
else
   echo "Given number $NUMBER is not greater than 90"
fi