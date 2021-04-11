CREATE TABLE "SYSTEM".logmnrc_tspart (
  logmnr_uid NUMBER NOT NULL,
  obj# NUMBER NOT NULL,
  ts# NUMBER NOT NULL,
  start_scn NUMBER NOT NULL,
  drop_scn NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_tspart_pk PRIMARY KEY (logmnr_uid,obj#,start_scn)
);