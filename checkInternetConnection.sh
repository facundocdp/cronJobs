#!/bin/bash

LOG_FILE="/home/pi/Documentos/CronJobs/CheckInternetConnection/ping.log"
CURRENT_DATE="$(date +"%Y-%m-%d %H:%M:%S")"
PING="$(ping -c1 www.google.com | head -n2)"

echo "--------------------------------">> "$LOG_FILE"
echo "Date $CURRENT_DATE. Ping: $PING" >> "$LOG_FILE"
