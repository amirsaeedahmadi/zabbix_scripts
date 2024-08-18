#!/bin/sh
#
#Author: Mahdi Chaydar
export ORACLE_HOSTNAME=rhda1.rhdbrac.rh
export ORACLE_UNQNAME=rhda
export ORACLE_BASE=/u01/app/oracle
export GRID_HOME=/u01/app/12.2.0/grid
export DB_HOME=$ORACLE_BASE/product/12.2.0/dbhome_1
export ORACLE_HOME=$DB_HOME
export JAVA_HOME=$ORACLE_HOME/jdk
export ORACLE_SID=rhda1
export ORACLE_TERM=xterm
export BASE_PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$BASE_PATH:$JAVA_HOME/bin
export ORACLE_PATH=/u01/app/oracle/sql/
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

while :
do
clear
sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_user_active_funda.sql > /u01/app/oracle/mahdi_script/temp1_colorful_user_active_funda.txt
sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_user_active_funda.txt
while IFS= read -r line
do
        /usr/bin/zabbix_sender -z 192.168.6.194 -s "funda" -k "$(awk '{print $1}' <<<"$line")" -o "$(awk '{print $2}' <<<"$line")"
done < /u01/app/oracle/mahdi_script/temp1_colorful_user_active_funda.txt

sleep 15
done

