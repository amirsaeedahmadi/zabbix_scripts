#!/bin/sh
#
#Author: Mahdi Chaydar
while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_active_session.sql > /u01/app/oracle/mahdi_script/temp1_colorful_active_session_g.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_active_session_g.txt
while IFS= read -r line
do
echo $line
	echo "rhda"$(awk '{print $1}' <<<"$line")".rhdbrac.rh"
	echo "$(awk '{print $2}' <<<"$line")"
	/usr/bin/zabbix_sender -z 192.168.6.194 -s "rhda$(awk '{print $1}' <<<"$line").rhdbrac.rh" -k "Active" -o "$(awk '{print $2}' <<<"$line")"
sleep 1
done < /u01/app/oracle/mahdi_script/temp1_colorful_active_session_g.txt
sleep 15
done
