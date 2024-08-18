set heading off
set feedback off
set time off
set timing off
col owner for a20
select c.owner,c.object_type,c.count_-b.count_  from current_invalid c , before_invalid b where b.owner=c.owner and b.object_type=c.object_type and c.count_>b.count_;
exit;

