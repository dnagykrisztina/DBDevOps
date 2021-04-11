CREATE TABLE "SYSTEM".logmnr_shard_ts (
  logmnr_uid NUMBER NOT NULL,
  tablespace_name VARCHAR2(90 BYTE) NOT NULL,
  chunk_number NUMBER NOT NULL,
  start_scnbas NUMBER,
  start_scnwrp NUMBER,
  CONSTRAINT logmnr_shard_ts_pk PRIMARY KEY (logmnr_uid,tablespace_name) DISABLE NOVALIDATE
);