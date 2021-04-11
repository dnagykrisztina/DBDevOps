CREATE TABLE "SYSTEM".logmnr_subcoltype$ (
  intcol# NUMBER NOT NULL,
  toid RAW(16) NOT NULL,
  version# NUMBER NOT NULL,
  intcols NUMBER,
  intcol#s RAW(2000),
  flags NUMBER,
  synobj# NUMBER,
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_subcoltype$_pk PRIMARY KEY (logmnr_uid,obj#,intcol#,toid) DISABLE NOVALIDATE
);