#!/bin/bash

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if Days are provided that will be considered, otherwise 14 days considered

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.LOG"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
   exit 1 #give other than 0 upto 127
else
   echo "You are running with root access" | tee -a $LOG_FILE
fi

# Validate functions takes input as exit status, what command they tried to install
VALIDATE(){
  if [ $1 -eq 0 ]
   then
      echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
   else
      echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
      exit 1
   fi       
}

USAGE(){
   echo -e "$R USAGE:: $N sh backup.sh <source_directory> <destination_directory> <days(optional)>"
}

if [ $# -lt 2 ]
then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
   echo -e "$R Source directory $SOURCE_DIR doesnot exist. Please check $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]
then
   echo -e "$R Destination directory $DEST_DIR doesnot exist. Please check $N"
   exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z "$FILES" ]
then
   echo "Files to zip are: $FILES"
   TIMESTAMP=$(date +%F-%H-%M-%S)
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   echo $FILES | zip -@ $ZIP_FILE  # @ means all files. Install zip file 

   if [ -f $ZIP_FILE ] # -d means directory, -f means file
   then
      echo -e "Successfully created zip file"
   else
      echo -e "Zip file creation ... $R FAILURE $N"
      exit 1
   fi       
else
   echo -e "No log files found older than 14 days ... $Y SKKIPING $N"
fi      