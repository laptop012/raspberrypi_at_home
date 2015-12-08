#!/bin/bash

ps aux | grep check_sensors.sh | grep -v grep
if [ $? == 0 ]; then
  echo "Process is running."
else
  echo "Process is not running."
  /etc/scripts/sensors_sms/check_sensors.sh
fi
