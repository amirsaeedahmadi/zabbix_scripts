set heading off
set feedback off
set time off
set timing off
column username         heading username        Format a2
column pdb_name         heading pdb_name        Format a20
column coun_            heading count           Format 9999
 select p.pdb_name,s.name service_name,count(*)
 from  cdb_services s ,cdb_pdbs p,gv$session gv
 where s.con_id=p.con_id and s.name=gv.service_name
  and gv.status='ACTIVE'
 AND GV.username is not null
 AND GV.username != 'SYS'
 AND GV.service_name not in ('SYS$BACKGROUND','SYS$USERS')
 GROUP BY p.pdb_name,s.name;
exit;


