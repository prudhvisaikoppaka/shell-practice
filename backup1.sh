#!/bin/bash

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.LOG"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p "$LOGS_FOLDER"

if [ $USERID -ne 0 ]; then
   echo -e "$R ERROR:: Please run this script with root access $N" | tee -a "$LOG_FILE"
   exit 1
fi

VALIDATE(){
  if [ $1 -eq 0 ]; then
      echo -e "$2 ... $G SUCCESS $N" | tee -a "$LOG_FILE"
  else
      echo -e "$2 ... $R FAILURE $N" | tee -a "$LOG_FILE"
      exit 1
  fi
}

USAGE(){
   echo -e "$R USAGE:: $N sh backup.sh <source_directory> <destination_directory> <days(optional)>"
}

if [ $# -lt 2 ]; then
   USAGE
   exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
   echo -e "$R Source directory $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
   echo -e "$R Destination directory $DEST_DIR does not exist $N"
   exit 1
fi

FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +$DAYS)

if [[ -n "$FILES" ]]; then
   echo "Files to zip:"
   echo "$FILES"

   TIMESTAMP=$(date +%F-%H-%M-%S)
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"

   find "$SOURCE_DIR" -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
   VALIDATE $? "Zip file creation"

   while IFS= read -r filepath
   do
      echo "Deleting file: $filepath" | tee -a "$LOG_FILE"
      rm -f "$filepath"
   done <<< "$FILES"

   echo -e "Old log files removed ... $G SUCCESS $N"
else
   echo -e "No log files older than $DAYS days ... $Y SKIPPING $N"
fi