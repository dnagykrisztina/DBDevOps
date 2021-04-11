CREATE TABLE "SYSTEM".logmnr_enc$ (
  obj# NUMBER,
  owner# NUMBER,
  encalg NUMBER,
  intalg NUMBER,
  colklc RAW(2000),
  klclen NUMBER,
  flag NUMBER,
  mkeyid VARCHAR2(192 BYTE) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_enc$_pk PRIMARY KEY (logmnr_uid,obj#,owner#) DISABLE NOVALIDATE
);