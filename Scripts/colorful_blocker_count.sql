set heading off
set feedback off
set time off
set timing off
select 'RACA'||s.inst_id||' has '||count(*)||' event '||b.WAIT_EVENT_TEXT||' '  from gv$session_blockers b, gv$session s  where b."BLOCKER_INSTANCE_ID" = s."INST_ID"   and b."BLOCKER_SID" = s."SID"   and s.username is not null    and s.username not in ('SYS', 'GG') group by s.inst_id,b.WAIT_EVENT_TEXT order by s.inst_id;
exit;

