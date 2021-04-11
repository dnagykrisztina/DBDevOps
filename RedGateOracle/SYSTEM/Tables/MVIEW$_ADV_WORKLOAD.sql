CREATE TABLE "SYSTEM".mview$_adv_workload (
  queryid# NUMBER NOT NULL,
  collectionid# NUMBER NOT NULL,
  collecttime DATE NOT NULL,
  "APPLICATION" VARCHAR2(128 BYTE),
  "CARDINALITY" NUMBER,
  resultsize NUMBER,
  uname VARCHAR2(128 BYTE) NOT NULL,
  qdate DATE,
  "PRIORITY" NUMBER,
  exec_time NUMBER,
  sql_text LONG NOT NULL,
  sql_textlen NUMBER NOT NULL,
  sql_hash NUMBER,
  sql_addr RAW(16),
  frequency NUMBER,
  CONSTRAINT mview$_adv_workload_pk PRIMARY KEY (queryid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_workload IS 'Shared workload repository for DBA users of summary advisor';