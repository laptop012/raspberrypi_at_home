#!/bin/bash
ps aux | grep ACM | grep -v grep
if [ $? -eq 0 ]; then
  echo "ARDUINO SUCCESS" > /etc/scripts/log/arduino_status.log
else
  echo "ARDUINO FAIL"  > /etc/scripts/log/arduino_status.log
fi
