#!/bin/bash
DATE=`date +%Y%m%d`
WATERFILE="_wetsensors.log"
SFILE="SMS_$DATE$WATERFILE"

_file="$1"
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }
[ ! -f "$_file" ] && { echo "Error: $0 file not found."; exit 2; }
 
if [ -s "$_file" ]
then
	echo "$_file has some data. VICHODIM"
        # do something as file has data
	echo "EXIT"
	exit 0
else
	echo "$_file is empty."
        # do something as file is empty 
fi
