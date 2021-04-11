CREATE TABLE "SYSTEM".logmnr_tabpart$ (
  obj# NUMBER(22),
  ts# NUMBER(22),
  part# NUMBER,
  bo# NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_tabpart$_pk PRIMARY KEY (logmnr_uid,obj#,bo#) DISABLE NOVALIDATE
);