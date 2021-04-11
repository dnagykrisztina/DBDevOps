CREATE TABLE "SYSTEM".logmnr_indpart$ (
  obj# NUMBER,
  bo# NUMBER,
  part# NUMBER,
  ts# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_indpart$_pk PRIMARY KEY (logmnr_uid,obj#,bo#) DISABLE NOVALIDATE
);