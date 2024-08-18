column inst_id         heading instid        Format 9999999
column WAIT_EVENT_TEXT heading WAIT_EVENT_TEXT format a30
column coun_            heading count           Format 9999
select /*+parallel+*/ s.inst_id ,count(1) coun_
  from gv$session_blockers b, gv$session s
 where b."BLOCKER_INSTANCE_ID" = s."INST_ID"
   and b."BLOCKER_SID" = s."SID"
   and s.username is not null
   and s.username not in ('SYS', 'GG')
group by s.inst_id
order by s.inst_id;
