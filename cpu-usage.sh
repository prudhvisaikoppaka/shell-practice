#!/bin/bash
# Get CPU usage percentage

while true; do
    cpu_usage=$(top -b-n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v )}
    echo "CPU Usage: ${cpu_usage}%"
    sleep 1
done
# Alternative using mpstat
# mpstat 1 1 | awk '/Average/ {print 100 - $NF"%"}'