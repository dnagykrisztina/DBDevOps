CREATE TABLE "SYSTEM".logmnr_con$ (
  owner# NUMBER NOT NULL,
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  con# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  start_scnbas NUMBER,
  start_scnwrp NUMBER,
  CONSTRAINT logmnr_con$_pk PRIMARY KEY (logmnr_uid,con#) DISABLE NOVALIDATE
);