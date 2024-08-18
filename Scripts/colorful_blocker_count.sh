#!/bin/sh
#
#Author: Mahdi Chaydar
while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_blocker_count.sql > /u01/app/oracle/mahdi_script/temp1_colorful_blocker_count.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_blocker_count.txt
while IFS= read -r line
do
echo -e "\e[101m \e[5m $line \e[0m \e[49m"
done < "/u01/app/oracle/mahdi_script/temp1_colorful_blocker_count.txt"

sleep 15
done

