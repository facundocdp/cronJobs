#!/bin/bash

TOKEN="<token>"
CHAT_ID="<chatId>"
CURRENT_DATE=$(date +"%H:%M:%S")
SONG="https://youtu.be/dQw4w9WgXcQ"
MESSAGE="Son las $CURRENT_DATE! Los dejo una canción para empezar el día $SONG"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE"
