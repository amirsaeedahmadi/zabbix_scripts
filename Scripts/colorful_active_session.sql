set heading off
set feedback off
set time off
set timing off
SELECT inst_id, COUNT(1)
FROM   GV$SESSION
WHERE  USERNAME IS NOT NULL
AND    USERNAME not in ('SYS','SYSTEM')
AND    STATUS ='ACTIVE'
group by inst_id;
exit;

