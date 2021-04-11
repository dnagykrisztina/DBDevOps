CREATE TABLE "SYSTEM".logmnr_lob$ (
  obj# NUMBER,
  intcol# NUMBER,
  col# NUMBER,
  lobj# NUMBER,
  "CHUNK" NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_lob$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);