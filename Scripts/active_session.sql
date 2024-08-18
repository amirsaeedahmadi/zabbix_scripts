column username         heading username        Format a2
column coun_            heading count           Format 9999
select s.inst_id,count(1) coun_ 
from "GV$SESSION" s 
where s.status = 'ACTIVE' 
      and s.username is not null 
      and s.username != 'SYS' 
group by s.inst_id 
order by 1;
