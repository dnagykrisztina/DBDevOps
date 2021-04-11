CREATE TABLE "SYSTEM".logmnrc_gsba (
  logmnr_uid NUMBER NOT NULL,
  as_of_scn NUMBER NOT NULL,
  fdo_length NUMBER,
  fdo_value RAW(255),
  charsetid NUMBER,
  ncharsetid NUMBER,
  dbtimezone_len NUMBER,
  dbtimezone_value VARCHAR2(192 BYTE),
  logmnr_spare1 NUMBER,
  logmnr_spare2 NUMBER,
  logmnr_spare3 VARCHAR2(1000 BYTE),
  logmnr_spare4 DATE,
  db_global_name VARCHAR2(384 BYTE),
  CONSTRAINT logmnrc_gsba_pk PRIMARY KEY (logmnr_uid,as_of_scn)
);