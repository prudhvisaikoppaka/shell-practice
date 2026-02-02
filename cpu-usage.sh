#!/bin/bash
# Get CPU usage percentage

while true; do
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: ${cpu_usage}%" 
    sleep 1
done    
# Alternative using mpstat
# mpstat 1 1 | awk '/Average/ {print 100 - $NF"%"}'