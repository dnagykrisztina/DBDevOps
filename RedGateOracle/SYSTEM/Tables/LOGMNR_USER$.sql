CREATE TABLE "SYSTEM".logmnr_user$ (
  user# NUMBER(22),
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_user$_pk PRIMARY KEY (logmnr_uid,user#) DISABLE NOVALIDATE
);