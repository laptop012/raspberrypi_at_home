#!/bin/bash -x
DIRLOG="/etc/scripts/log/balance"
# Скрипт запроса баланса Мегафон
# Удаляем все SMS
gnokii --config /etc/gnokii.conf --deletesms SM 0 end
# Делаем запрос о балансе
echo "0" | gnokii --config /etc/gnokii.conf --sendsms 000100
sleep 2
gnokii --config /etc/gnokii.conf --getsms SM 0 5 -F $DIRLOG/3g-balance.txt
sed -ie 's/^M/\n/g' $DIRLOG/3g-balance.txt
sleep 5
#Получаем значение уровня сигнала.
SIGNAL=`gnokii --config /etc/gnokii.conf --monitor once | grep RFLevel > /tmp/rflevel`
cat /tmp/rflevel|sed 's/RFLevel/Signal/g' >> $DIRLOG/3g-balance.txt
#Отправляем SMS с балансом и уровнем сигнала
cat $DIRLOG/3g-balance.txt | grep 'Subject\|Signal'|sed 's/Subject/CURRENT_BALANCE/g' > $DIRLOG/sms_balance.log
cat $DIRLOG/sms_balance.log > $DIRLOG/sms_all_balance_status.log
#cat $DIRLOG/arduino_status.log >> $DIRLOG/sms_all_balance_status.log
cat $DIRLOG/sms_all_balance_status.log|gnokii --config /etc/gnokii.conf --sendsms '+79161141050'
#echo "test123" |gnokii --config /etc/gnokii.conf --sendsms '+79161141050' 
exit 0
