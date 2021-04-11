CREATE TABLE "SYSTEM".logmnr_indcompart$ (
  obj# NUMBER,
  dataobj# NUMBER,
  bo# NUMBER,
  part# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_indcompart$_pk PRIMARY KEY (logmnr_uid,obj#) DISABLE NOVALIDATE
);