CREATE TABLE "SYSTEM".logmnr_did$ (
  session# NUMBER NOT NULL,
  logmnr_did NUMBER,
  flags NUMBER DEFAULT 0,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  spare4 TIMESTAMP,
  CONSTRAINT logmnr_did$_pk PRIMARY KEY (session#)
);