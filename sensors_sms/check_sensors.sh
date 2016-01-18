#!/bin/bash -x

DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="$DATE$WATERFILE"
DIR="/etc/scripts/sensors_sms"
DIRLOG="/etc/scripts/log/sensors"
# Chitaem dannie is ARDUINO
rm $DIRLOG/sensors.html
sleep 1
curl http://192.168.88.177 > $DIRLOG/sensors.html
# UDalyiem html razmetku iz faila
sed -i -e :a -e 's/<[^>]*>//g;/</N;//ba;s/^[ \t]*//;s/[ \t]*$//' $DIRLOG/sensors.html
sed -i 's/'"$(printf '\015')"'$//g' $DIRLOG/sensors.html
sed -i '/^$/d' $DIRLOG/sensors.html
# Check file on Warning
    cat $DIRLOG/sensors.html | grep WARNING
	if [ $? == 0 ]; then
	cat $DIRLOG/sensors.html | grep -a WARNING> $DIR/$SFILE
	echo "CREATE_FILE"
	touch $DIR/SMS_$SFILE
	# sozdaem pustoy fail i zapuskaem script_sms
	$DIR/script_sms.sh $DIR/SMS_$SFILE
	exit
# Esli fail pustoy, to vse OK
	else
	sleep 5
	echo "VSE_HOROSHO"
	exit
exit
fi
done
