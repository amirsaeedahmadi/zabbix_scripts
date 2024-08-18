#!/bin/sh
#
#Author: Mahdi Chaydar
while :
do
clear
srvctl status service -db raca > /u01/app/oracle/mahdi_script/temp1_colorful_service.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_service.txt
while IFS= read -r line
do
if  echo " "$(awk '{print $0}' <<<"$line")" " | grep not > /dev/null   ; then
	echo -e "\e[101m \e[5m  "$(awk '{print $2}' <<<"$line")"  is not running \e[0m \e[49m"
else
	echo " "$(awk '{print $2}' <<<"$line")" on "$(awk '{print $7}' <<<"$line")" "
fi
done < /u01/app/oracle/mahdi_script/temp1_colorful_service.txt

sleep 30
done

