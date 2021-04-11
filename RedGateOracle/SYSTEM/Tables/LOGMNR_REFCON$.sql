CREATE TABLE "SYSTEM".logmnr_refcon$ (
  col# NUMBER,
  intcol# NUMBER,
  reftyp NUMBER,
  stabid RAW(16),
  expctoid RAW(16),
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_refcon$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);