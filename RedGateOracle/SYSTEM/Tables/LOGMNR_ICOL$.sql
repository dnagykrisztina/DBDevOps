CREATE TABLE "SYSTEM".logmnr_icol$ (
  obj# NUMBER,
  bo# NUMBER,
  col# NUMBER,
  pos# NUMBER,
  segcol# NUMBER,
  intcol# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_icol$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);