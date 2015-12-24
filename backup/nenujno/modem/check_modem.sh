#!/bin/bash
# ÐPROVERKA MODEMA
gnokii --config /etc/gnokii.conf --identify
if [ $? -eq 0 ]; then
  echo "Modem success"
exit
else
  echo "Modem not found"
exit
fi

