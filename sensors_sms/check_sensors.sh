#!/bin/bash -x

DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="$DATE$WATERFILE"

while true
do
# Chitaem dannie s com porta
cat /tmp/serial | grep WET
    if [ $? == 0 ]; then
# zapisivaem ih v fail
    cat /tmp/serial | grep WET > $SFILE
    echo "CREATE_FILE"
    touch $PWD/SMS_$SFILE
# sozdaem pustoy fail i zapuskaem script_sms
    $PWD/script_sms.sh SMS_$SFILE
    exit
    else
    sleep 5
    echo "VSE_HOROSHO"
fi
done
