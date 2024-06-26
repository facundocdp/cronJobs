#!/bin/bash

LOG_FILE="/home/pi/Documentos/CronJobs/MonitorRPi/monitorRPi.log"

current_date=$(date +"%Y-%m-%d %H:%M:%S")
disk=$(df -h | head -n 2)
sensor=$(sensors | tail -n 6 | head -n 2)
up=$(uptime)
ram=$(free -h)

echo -e "Current date: $current_date" >> "$LOG_FILE"
echo -e "Disk space:\n $disk\nTemperature:\n $sensors\nUptime:\n $up\nMemory RAM:\n $ram." >> "$LOG_FILE"
echo -e "---------------------------------------------" >> "$LOG_FILE"
