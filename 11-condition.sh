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

IF [ $NUMBER 99 -gt 10 ]
then
   echo "Given number $NUMBER is gretaer than 10"
else
   echo "Given number $NUMBER is less than 10"
fi