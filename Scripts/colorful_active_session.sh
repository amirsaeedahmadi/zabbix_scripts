#!/bin/sh
#
#Author: Mahdi Chaydar
while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_active_session.sql > /u01/app/oracle/mahdi_script/temp1_colorful_active_session.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_active_session.txt
while IFS= read -r line
	/usr/bin/zabbix_sender -z 192.168.6.194 -s "raca0$(awk '{print $1}' <<<"$line").rhrac.rh" -k "Active" -o "$(awk '{print $2}' <<<"$line")"  2>&1 > /dev/null
do
	#echo "my inst_id is "$(awk '{print $1}' <<<"$line")"  and currently has "$(awk '{print $2}' <<<"$line")" session"
if [ "$(awk '{print $2}' <<<"$line")" -gt 100 ]; then
	echo -e "\e[101m \e[5m RACA "$(awk '{print $1}' <<<"$line")" has "$(awk '{print $2}' <<<"$line")" \e[0m \e[49m"
else
	echo "RACA "$(awk '{print $1}' <<<"$line")" has "$(awk '{print $2}' <<<"$line")" "
fi
done < /u01/app/oracle/mahdi_script/temp1_colorful_active_session.txt

sleep 15
done

