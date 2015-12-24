#!/bin/bash
DATE=`date +%Y%m%d`
AFILE="ARDUINO_FAIL"
DIRSCRIPT="/etc/scripts/sensors_sms"
AFILESEND="ARDUINO_FAIL_SEND"
_file="$1"
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }
[ ! -f "$_file" ] && { echo "Error: $0 file not found."; exit 2; }
 
if [ -s "$_file" ]
then
	echo "$_file has some data."
        # do something as file has data
else
# esli fail pustoy otpravliaem sms i sozadem fail s dannimy. Esli fail s dannimy ne pustoy, sms ne otpravliam
	echo "$_file is empty."
	echo "send sms"
	cat $DIRSCRIPT/$AFILE |gnokii --config /etc/gnokii.conf --sendsms '+79161141050'
	touch $DIRSCRIPT/$AFILESEND
	cat $DIRSCRIPT/$AFILE > $DIRSCRIPT/$AFILESEND
        # do something as file is empty 
fi
