CREATE TABLE "SYSTEM".logmnrc_gsii (
  logmnr_uid NUMBER NOT NULL,
  obj# NUMBER NOT NULL,
  bo# NUMBER NOT NULL,
  indtype# NUMBER NOT NULL,
  drop_scn NUMBER,
  logmnr_spare1 NUMBER,
  logmnr_spare2 NUMBER,
  logmnr_spare3 VARCHAR2(1000 BYTE),
  logmnr_spare4 DATE,
  CONSTRAINT logmnrc_gsii_pk PRIMARY KEY (logmnr_uid,obj#)
);