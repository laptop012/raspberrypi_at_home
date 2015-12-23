#!/bin/bash -x

DATE=`date +%Y%m%d`
DIRLOG="/etc/scripts/log/sensors"
#curl -v --silent http://192.168.88.177 2>&1 | grep WARNING > $DIRLOG/'$DATE'_sensors
#curl --silent http://192.168.88.177 2>&1 > /tmp/'$DATE'_sensors
curl http://192.168.88.177 > $DIRLOG/sensors.html
sleep 1
cat $DIRLOG/sensors.html | grep WARNING > $DIRLOG/"$DATE"_WARNING_sensors.log
exit
fi

