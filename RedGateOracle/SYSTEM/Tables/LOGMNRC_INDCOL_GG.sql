CREATE TABLE "SYSTEM".logmnrc_indcol_gg (
  logmnr_uid NUMBER NOT NULL,
  obj# NUMBER NOT NULL,
  commit_scn NUMBER NOT NULL,
  intcol# NUMBER NOT NULL,
  pos# NUMBER NOT NULL,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_indcol_gg_pk PRIMARY KEY (logmnr_uid,obj#,commit_scn,intcol#)
);