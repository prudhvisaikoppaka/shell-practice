#!/bin/bash

NUMBER=$9

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER 9 -lt 10 ]
then
   echo "Given number $NUMBER is less than 10"
else
   echo "Given number $NUMBER is not less than 10"
fi

NUMBER=$99

if [ $NUMBER 99 -gt 10 ]
   echo "Given number $NUMBER is greater than 10"
else
   echo "Given number $NUMBER is not greater than 10"
fi