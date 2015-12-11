#!/bin/bash
DATE=`date +%Y%m%d_%T`
DIRLOG="/etc/scripts/log/balance"

ps aux | grep ACM | grep -v grep
if [ $? -eq 0 ]; then
  echo "ARDUINO SUCCESS_$DATE" > $DIRLOG/arduino_status.log
else
  echo "ARDUINO FAIL_$DATE"  > $DIRLOG/arduino_status.log
fi
