#!/bin/bash
# �PROVERKA MODEMA
gnokii --config /etc/gnokii.conf --identify
if [ $? -eq 0 ]; then
  echo "Modem success"
else
  echo "Modem not found"
fi

