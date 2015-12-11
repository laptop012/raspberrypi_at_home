#!/bin/bash -x

DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="$DATE$WATERFILE"
DIR="/etc/scripts/sensors_sms"
while true
do
# Chitaem dannie s com porta
echo -n > /tmp/serial
sleep 2
echo -n check > /dev/ttyACM0
sleep 30
cat /tmp/serial | grep WET
    if [ $? == 0 ]; then
# zapisivaem ih v fail
    cat /tmp/serial | grep -a WET > $DIR/$SFILE
    echo "CREATE_FILE"
    touch $DIR/SMS_$SFILE
# sozdaem pustoy fail i zapuskaem script_sms
    $DIR/script_sms.sh $DIR/SMS_$SFILE
    exit
# Если данные не получены, то считаем, что все хорошо и ничего не делаем
    else
    sleep 5
    echo "VSE_HOROSHO"
exit
fi
done
