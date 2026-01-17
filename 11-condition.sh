#!/bin/bash

NUMBER=$9

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER -gt 10 ]
then
   echo "Given number $NUMBER is greater than 10"
else
   echo "Given number $NUMBER is not greater than 10"
fi