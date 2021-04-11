CREATE TABLE "SYSTEM".logmnrc_con_gg (
  logmnr_uid NUMBER NOT NULL,
  con# NUMBER NOT NULL,
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  commit_scn NUMBER NOT NULL,
  drop_scn NUMBER,
  baseobj# NUMBER NOT NULL,
  baseobjv# NUMBER NOT NULL,
  flags NUMBER NOT NULL,
  indexobj# NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 NUMBER,
  spare4 VARCHAR2(4000 BYTE),
  spare5 VARCHAR2(4000 BYTE),
  spare6 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_con_gg_pk PRIMARY KEY (logmnr_uid,con#,commit_scn)
);