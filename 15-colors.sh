#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run this script with root access"
   exit 1 #give other than 0 upto 127
else
   echo "You are running with root access"
fi

# Validate functions takes input as exit status, what command they tried to install
VALIDATE(){
  if [ $1 -eq 0 ]
   then
      echo -e "Installing $2 is ... $G SUCCESS"
   else
      echo -e "Installing $2 is ... $R FAILURE"
      exit 1
   fi       
}

dnf list installed mysql
if [ $? -ne 0 ]
then      
   echo "mysql is not installed... going to install it"
   dnf install mysql -y
   VALIDATE $? "mysql"
else
   echo -e "$G mysql is already installed."
fi

dnf list installed python3
if [ $? -ne 0 ]
then      
   echo "Python3 is not installed... going to install it"
   dnf install Python3 -y
   VALIDATE $? "Python3"
else
   echo -e "$G Python3 is already installed."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then      
   echo "nginx is not installed... going to install it"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo -e "$G nginx is already installed."
fi