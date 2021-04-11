CREATE TABLE "SYSTEM".logmnr_indsubpart$ (
  obj# NUMBER(22),
  dataobj# NUMBER(22),
  pobj# NUMBER(22),
  subpart# NUMBER(22),
  ts# NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_indsubpart$_pk PRIMARY KEY (logmnr_uid,obj#,pobj#) DISABLE NOVALIDATE
);