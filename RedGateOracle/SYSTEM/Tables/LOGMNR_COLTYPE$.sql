CREATE TABLE "SYSTEM".logmnr_coltype$ (
  col# NUMBER,
  intcol# NUMBER,
  toid RAW(16),
  version# NUMBER,
  packed NUMBER,
  intcols NUMBER,
  intcol#s RAW(2000),
  flags NUMBER,
  typidcol# NUMBER,
  synobj# NUMBER,
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_coltype$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#) DISABLE NOVALIDATE
);