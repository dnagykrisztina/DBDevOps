CREATE TABLE "SYSTEM".logmnrc_shard_ts (
  logmnr_uid NUMBER NOT NULL,
  tablespace_name VARCHAR2(90 BYTE) NOT NULL,
  chunk_number NUMBER NOT NULL,
  start_scn NUMBER NOT NULL,
  drop_scn NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_shard_ts_pk PRIMARY KEY (logmnr_uid,tablespace_name,start_scn)
);