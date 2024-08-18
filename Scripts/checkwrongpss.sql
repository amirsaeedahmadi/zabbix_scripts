set heading off
set feedback off
set time off
set timing off
col os_username for a20
col userhost for a50
col ip for a40
col dbusername for a40
select distinct  os_username,userhost,	dbusername  from UNIFIED_AUDIT_TRAIL U
	WHERE u.event_timestamp > sysdate-1/24 and u.return_code=1017 ;
	exit;

