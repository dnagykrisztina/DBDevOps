CREATE TABLE "SYSTEM".logmnr_attrcol$ (
  intcol# NUMBER,
  "NAME" VARCHAR2(4000 BYTE),
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_attrcol$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);