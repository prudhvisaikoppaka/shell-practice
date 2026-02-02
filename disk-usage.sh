#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in project it will be 75
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
  USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7F}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
      MSG+="High Disk Usage on $PARTITION: $USAGE <br>" # \n is for New line in shell # <br> represents HTML new line
  fi
done <<< $DISK_USAGE

#echo -e $MSG  -e for enable new line

sh mail.sh "DevOps Team" "High Disk Usage" "$IP" "$MSG" "prudhvisaikoppaka9989@gmail.com" "ALERT-High Disk Usage"