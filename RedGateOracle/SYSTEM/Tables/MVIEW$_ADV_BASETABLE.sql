CREATE TABLE "SYSTEM".mview$_adv_basetable (
  collectionid# NUMBER NOT NULL,
  queryid# NUMBER NOT NULL,
  "OWNER" VARCHAR2(128 BYTE),
  table_name VARCHAR2(128 BYTE),
  table_type NUMBER,
  CONSTRAINT mview$_adv_basetable_fk FOREIGN KEY (queryid#) REFERENCES "SYSTEM".mview$_adv_workload (queryid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_basetable IS 'Base tables refered by a query';