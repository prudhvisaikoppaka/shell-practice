#!/bin/bash
# Get CPU usage percentage


cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: ${cpu_usage}%"   
# Alternative using mpstat
# mpstat 1 1 | awk '/Average/ {print 100 - $NF"%"}'