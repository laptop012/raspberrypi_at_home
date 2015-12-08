ps aux | grep sensors | grep -v grep
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  echo "Process is not running."
  /etc/scripts/sensors_sms/check_sensors.sh &
fi
