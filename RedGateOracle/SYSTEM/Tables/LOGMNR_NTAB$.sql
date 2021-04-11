CREATE TABLE "SYSTEM".logmnr_ntab$ (
  col# NUMBER,
  intcol# NUMBER,
  ntab# NUMBER,
  "NAME" VARCHAR2(4000 BYTE),
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_ntab$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);