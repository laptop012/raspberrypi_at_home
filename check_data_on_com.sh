#!/bin/bash
ps aux | grep ACM | grep -v grep
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  echo "Process is not running."
  rm /tmp/serial
  cat /dev/ttyACM0 > /tmp/serial &
fi

