CREATE TABLE "SYSTEM".logmnr_opqtype$ (
  intcol# NUMBER NOT NULL,
  "TYPE" NUMBER,
  flags NUMBER,
  lobcol NUMBER,
  objcol NUMBER,
  extracol NUMBER,
  schemaoid RAW(16),
  elemnum NUMBER,
  schemaurl VARCHAR2(4000 BYTE),
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_opqtype$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);