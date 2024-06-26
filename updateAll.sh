#!/bin/bash

LOG_FILE="/home/pi/Documentos/CronJobs/UpdateAll/updateAll.log"
TOKEN="<TOKEN>"
CHAT_ID="<ChatId>"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

CURRENT_DATE="$(date +"%Y-%m-%d %H:%M:%S")"

function handle_error {
	local step_number=$1
	local command=$2
        MESSAGE="ERROR! Cron job on Raspberry Pi 'UpdateAll' failed."
	curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE"
	echo "Date $CURRENT_DATE. ERROR! The command '$command' failed at step '$step_number'." >> "$LOG_FILE"
	exit 1
}

trap 'handle_error $LINENO' ERR

set -e

{
	sudo apt update && sudo apt upgrade -y || handle_error 1 "sudo apt update && sudo apt upgrade -y"
	sudo apt autoclean && sudo apt autoremove -y || handle_error 2 "sudo apt autoclean && sudo apt autoremove -y"
	sudo updatedb || handle_error 3 "sudo updatedb" #Update locate command database
	sudo pihole -up || handle_error 4 "sudo pihole -up" #Update Pi-hole
} || handle_error "script execution" #Handle other error

echo "Date $CURRENT_DATE. Succesfully updated!" >> "$LOG_FILE"
