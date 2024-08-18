# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
export TMP=/tmp
export TMPDIR=$TMP

export ORACLE_HOSTNAME=racb01.rhrac.rh
export ORACLE_UNQNAME=racb
export ORACLE_BASE=/u01/app/oracle
export GRID_HOME=/u01/app/21.3.0/grid
export GGATE_HOME=/u01/app/oracle/ogg/
export DB_HOME=$ORACLE_BASE/product/21.3.0/db_1
export ORACLE_HOME=$DB_HOME
export ORACLE_SID=racb1
export ORACLE_TERM=xterm
export ORACLE_PATH=/u01/app/oracle/sql/
export BASE_PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$BASE_PATH

export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

alias grid_env='. /home/oracle/grid_env'
alias db_env='. /home/oracle/db_env'
alias sql='sqlplus / as sysdba'

# User specific environment and startup programs

while :
do
	echo -e "\e[103m \e[5m"
	clear
	sqlplus -S sys/RayanSys12@brkbm as  sysdba @/u01/app/oracle/mahdi_script/invobj_structure.sql > /dev/null 2>&1  
        sqlplus -S sys/RayanSys12@brkbm as  sysdba @/u01/app/oracle/mahdi_script/check_invobj.sql > /u01/app/oracle/mahdi_script/check_invobj.txt
	sed -i '/^$/d' /u01/app/oracle/mahdi_script/check_invobj.txt
	sqlplus -S sys/RayanSys12@brkbm as  sysdba @/u01/app/oracle/mahdi_script/checkwrongpss.sql >/u01/app/oracle/mahdi_script/checkwrongpss.txt
	sed -i '/^$/d' /u01/app/oracle/mahdi_script/checkwrongpss.txt


while  IFS= read -r line
do
	echo "$(awk '{print $1}' <<<"$line") has $(awk '{print $3}' <<<"$line") new invalid object with type $(awk '{print $2}' <<<"$line") "
done </u01/app/oracle/mahdi_script/check_invobj.txt

while  IFS= read -r line
do
	        echo "osuser $(awk '{print $1}' <<<"$line") are entering wrong pass from  $(awk '{print $2}' <<<"$line") for schema $(awk '{print $3}' <<<"$line") "
done </u01/app/oracle/mahdi_script/checkwrongpss.txt


sleep 900
done



