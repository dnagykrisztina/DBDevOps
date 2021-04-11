CREATE TABLE "SYSTEM".logmnr_tabcompart$ (
  obj# NUMBER(22),
  bo# NUMBER(22),
  part# NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_tabcompart$_pk PRIMARY KEY (logmnr_uid,obj#) DISABLE NOVALIDATE
);