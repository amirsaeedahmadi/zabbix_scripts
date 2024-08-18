#!/bin/sh
#
#Author: Mahdi Chaydar

echo "#####RACB#####"
VALUE=`sqlplus -silent / as sysdba  << END
@/u01/app/oracle/mahdi_script/blocker_count.sql
exit;
END`
echo "$VALUE"
