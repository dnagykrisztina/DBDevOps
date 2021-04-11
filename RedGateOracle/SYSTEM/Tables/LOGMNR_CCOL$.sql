CREATE TABLE "SYSTEM".logmnr_ccol$ (
  con# NUMBER,
  obj# NUMBER,
  col# NUMBER,
  pos# NUMBER,
  intcol# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_ccol$_pk PRIMARY KEY (logmnr_uid,con#,intcol#) DISABLE NOVALIDATE
);