#!/bin/bash
DATE=`date +%Y%m%d`

ps aux | grep ACM | grep -v grep
if [ $? -eq 0 ]; then
  echo "ARDUINO SUCCESS_$DATE" > /etc/scripts/log/arduino_status.log
else
  echo "ARDUINO FAIL_$DATE"  > /etc/scripts/log/arduino_status.log
fi
