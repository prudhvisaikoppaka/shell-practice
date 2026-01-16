#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1 #give other than 0 upto 127
else
   echo "You are running with root access"
fi

dnf installed mysql -y

if [ $? -eq 0 ]
then
   echo "MySQL is not installed... going to install it"
else
   echo "MySQL is already installed...Nothing to do" 
   exit 1
fi      