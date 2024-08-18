truncate table before_invalid;
insert into before_invalid select * from current_invalid;
truncate table current_invalid;
insert into current_invalid select owner,object_type,count(*) count_ from dba_objects where status <> 'VALID' group by owner,object_type;
insert into before_invalid (owner,object_type,count_)  select owner,object_type,0  from current_invalid  minus   select owner,object_type,0  from  before_invalid;
commit;
exit;

