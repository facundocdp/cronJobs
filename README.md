# cronJobs
*List of Cronjobs on my Raspberry Pi 3b.*

## Description

### · Check Internet connection
It creates a log file and saves a ping to www.google.com with the current date.

### · Monitor RPi
Checks disk space, temperature, uptime, and memory RAM and saves it into a log file with the current date.

### · Update all
Update, upgrade, autoclean, autoremove and pi-hole update. If it fails, send a Telegram message.
>>
A text is sent to a log file with the current date. 
 
### · Clear logs
It clears log files from the other cron jobs. I set this job to run every Monday at 6 am.

### · Telegram bot
A basic Telegram bot that sends a YouTube video to a group.
