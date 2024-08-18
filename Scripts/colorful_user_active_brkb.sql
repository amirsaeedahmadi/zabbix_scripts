set heading off
set feedback off
set time off
set timing off
select username,count(*) from gv$session where username is not null and username<>'SYS' AND CON_ID=5 and status='ACTIVE' GROUP BY USERNAME;
EXIT;


