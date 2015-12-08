#!/bin/bash -x

DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="$DATE$WATERFILE"

while true
do

cat /tmp/serial | grep WET
    if [ $? == 0 ]; then
    cat /tmp/serial | grep WET > $SFILE
    echo "CREATE_FILE"
    $PWD/script2.sh $SFILE
    $PWD/script1.sh $SFILE
    exit
    else
    sleep 5
    echo "VSE_HOROSHO"
fi
done
