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
	clear
	sqlplus -S / as sysdba @/u01/app/oracle/mahdi_script/colorful_user_active_brkb.sql > /u01/app/oracle/mahdi_script/temp1_colorful_user_active_brkb.txt
	sed -i '/^$/d' /u01/app/oracle/mahdi_script/temp1_colorful_user_active_brkb.txt
	while IFS= read -r line
	do
		        /usr/bin/zabbix_sender -z 192.168.6.194 -s "brkb" -k "$(awk '{print $1}' <<<"$line")" -o "$(awk '{print $2}' <<<"$line")"
		done < /u01/app/oracle/mahdi_script/temp1_colorful_user_active_brkb.txt

		sleep 15
	done

