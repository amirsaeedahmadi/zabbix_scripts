#!/bin/sh
#
#Author: Mahdi Chaydar

echo "#####RACB#####"
VALUE=`sqlplus -silent / as sysdba << END
@/u01/app/oracle/mahdi_script/active_session.sql
exit;
END`
echo "$VALUE"
