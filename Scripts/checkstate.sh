#!/bin/bash
Red=$'\e[0;41m \e[1;33m'
Blue=$'\e[0;42m \e[1;34m'
Normal=$'\e[0m \e[49m'
while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/checkdb.sql > /u01/app/oracle/mahdi_script/tempcheckdb.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/tempcheckdb.txt
while IFS= read -r line
do
if [ "$(awk '{print $1}' <<<"$line")" = ok ]; then
        echo "$Blue `hostname`"
else
        echo "$Red `hostname`"
fi
done < /u01/app/oracle/mahdi_script/tempcheckdb.txt
sleep 15
done

