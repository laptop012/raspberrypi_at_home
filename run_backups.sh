#!/bin/bash -x

TIMESTAMP=`date +%Y%m%d.%H%M`
DEST_DIR="/root/BACKUPS"
SRC_DIR="/etc/scripts"
FNAME="MyBackup_scripts"
tar -vczf ${DEST_DIR}/${FNAME}-${TIMESTAMP}.tar.gz ${SRC_DIR}
exit
