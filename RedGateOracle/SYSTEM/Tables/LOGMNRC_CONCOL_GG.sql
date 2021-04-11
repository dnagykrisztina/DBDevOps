CREATE TABLE "SYSTEM".logmnrc_concol_gg (
  logmnr_uid NUMBER NOT NULL,
  con# NUMBER NOT NULL,
  commit_scn NUMBER NOT NULL,
  intcol# NUMBER NOT NULL,
  pos# NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_concol_gg_pk PRIMARY KEY (logmnr_uid,con#,commit_scn,intcol#)
);