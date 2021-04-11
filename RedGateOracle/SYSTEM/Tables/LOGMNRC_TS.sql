CREATE TABLE "SYSTEM".logmnrc_ts (
  logmnr_uid NUMBER NOT NULL,
  ts# NUMBER(22) NOT NULL,
  "NAME" VARCHAR2(90 BYTE),
  start_scn NUMBER NOT NULL,
  drop_scn NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_ts_pk PRIMARY KEY (logmnr_uid,ts#,start_scn)
);