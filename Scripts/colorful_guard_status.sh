#!/bin/sh
#
while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_guard_status.sql > /u01/app/oracle/mahdi_script/temp1_colorful_guard_status.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_guard_status.txt
while IFS= read -r line
do
	#echo "my inst_id is "$(awk '{print $1}' <<<"$line")"  and currently has "$(awk '{print $2}' <<<"$line")" session"
if [ "$(awk '{print $6}' <<<"$line")" -gt 5 ]; then
	echo -e "\e[101m \e[5m RACA THREAD  "$(awk '{print $2}' <<<"$line")" has "$(awk '{print $6}' <<<"$line")" LOG DIFF \e[0m \e[49m"
else
	echo "RACA THREAD "$(awk '{print $2}' <<<"$line")" has "$(awk '{print $6}' <<<"$line")" LOG DIFF "
fi
done < /u01/app/oracle/mahdi_script/temp1_colorful_guard_status.txt

sleep 60
done

