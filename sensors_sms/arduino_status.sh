#!/bin/bash -x
DATE=`date +%Y%m%d_%T`
DIRLOG="/etc/scripts/log/balance"
DIRSCRIPT="/etc/scripts/sensors_sms"
ARDUINOIP="192.168.88.177"
curl http://$ARDUINOIP
if [ $? -eq 7 ]; then
  touch $DIRSCRIPT/ARDUINO_FAIL
  rm $DIRSCRIPT/ARDUINO_SUCCESS
  echo "ARDUINO FAIL_$DATE" > $DIRLOG/arduino_status.log
  echo "ARDUINO FAIL_$DATE" > $DIRSCRIPT/ARDUINO_FAIL
    if [ -f $DIRSCRIPT/ARDUINO_FILE_SMS ]; then
    echo "SMS_SEND_FILE_EXIST"
    else
    cat $DIRSCRIPT/ARDUINO_FAIL |gnokii --config /etc/gnokii.conf --sendsms '+79161141050'
    echo "SMS_SEND" > $DIRSCRIPT/ARDUINO_FILE_SMS
    fi
exit
else
  echo "ARDUINO SUCCESS_$DATE"  > $DIRLOG/arduino_status.log
  echo "ARDUINO SUCCESS_$DATE" > $DIRSCRIPT/ARDUINO_SUCCESS
  rm $DIRSCRIPT/ARDUINO_FAIL
  rm $DIRSCRIPT/ARDUINO_FILE_SMS
exit
fi
