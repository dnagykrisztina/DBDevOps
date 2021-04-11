CREATE TABLE "SYSTEM".mview$_adv_sqldepend (
  collectionid# NUMBER,
  inst_id NUMBER,
  from_address RAW(16),
  from_hash NUMBER,
  to_owner VARCHAR2(128 BYTE),
  to_name VARCHAR2(1000 BYTE),
  to_type NUMBER,
  "CARDINALITY" NUMBER
);
COMMENT ON TABLE "SYSTEM".mview$_adv_sqldepend IS 'Temporary table for workload collections';