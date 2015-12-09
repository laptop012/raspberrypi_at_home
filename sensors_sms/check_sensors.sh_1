#!/bin/bash

DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="$DATE$WATERFILE"
DIR="/etc/scripts/sensors_sms"
while true
do
# Chitaem dannie s com porta
cat /tmp/serial | grep WET
    if [ $? == 0 ]; then
# zapisivaem ih v fail
    cat /tmp/serial | grep WET > $DIR/$SFILE
    echo "CREATE_FILE"
    touch $DIR/SMS_$SFILE
# sozdaem pustoy fail i zapuskaem script_sms
    $DIR/script_sms.sh $DIR/SMS_$SFILE
    exit
    else
    sleep 5
    echo "VSE_HOROSHO"
fi
done
