set heading off
set feedback off
set time off
set timing off
column username         heading username        Format a2
column coun_            heading count           Format 9999
select a.dest_id, a.thread# , b.last_seq , a.applied_seq, a.last_app_timestamp, b.last_seq-a.applied_seq arc_diff
from (select dest_id,thread#, max(sequence#) applied_seq , max(next_time) last_app_timestamp from gv$archived_log ll
where applied='YES'  and name is not null GROUP BY dest_id , thread#) A , (SELECT THREAD# , MAX(SEQUENCE#) LAST_SEQ FROM GV$ARCHIVEd_LOG GROUP BY THREAD#) B
WHERE A.THREAD# = B.THREAD# and dest_id not in (1,32) order by dest_id ,thread#;
exit;

