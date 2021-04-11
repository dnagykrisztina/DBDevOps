CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM".mview_workload (workloadid,import_time,queryid,"APPLICATION","CARDINALITY",resultsize,lastuse,frequency,"OWNER","PRIORITY","QUERY",responsetime) AS
select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');
COMMENT ON TABLE "SYSTEM".mview_workload IS 'This view gives DBA access to shared workload';