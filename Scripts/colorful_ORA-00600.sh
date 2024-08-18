#!/bin/sh
#
#Author: Mahdi Chaydar
while :
do
clear
cat /u01/app/oracle/diag/rdbms/rhda/rhda1/trace/alert_rhda1.log |grep ORA-00600 |wc -l > /u01/app/oracle/mahdi_script/temp_colorful_ORA-00600.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp_colorful_ORA-00600.txt
while IFS= read -r line
do
	#echo "my inst_id is "$(awk '{print $1}' <<<"$line")"  session"
if [ "$(awk '{print $1}' <<<"$line")" -gt 0 ]; then
	echo -e "\e[43m  RHDA1 "$(awk '{print $1}' <<<"$line")" has ORA-00600  \e[0m \e[49m"
else
	echo "RHDA1 "$(awk '{print $1}' <<<"$line")" has ORA-00600 "
fi
done < /u01/app/oracle/mahdi_script/temp_colorful_ORA-00600.txt

sleep 10
done

