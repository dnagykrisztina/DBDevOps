CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM".mview_recommendations (runid,all_tables,fact_tables,grouping_levels,query_text,recommendation_number,recommended_action,mview_owner,mview_name,storage_in_bytes,pct_performance_gain,benefit_to_cost_ratio) AS
select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;
COMMENT ON TABLE "SYSTEM".mview_recommendations IS 'This view gives DBA access to summary recommendations';