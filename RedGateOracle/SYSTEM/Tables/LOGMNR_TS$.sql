CREATE TABLE "SYSTEM".logmnr_ts$ (
  ts# NUMBER(22),
  "NAME" VARCHAR2(90 BYTE),
  owner# NUMBER(22),
  "BLOCKSIZE" NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  start_scnbas NUMBER,
  start_scnwrp NUMBER,
  CONSTRAINT logmnr_ts$_pk PRIMARY KEY (logmnr_uid,ts#) DISABLE NOVALIDATE
);