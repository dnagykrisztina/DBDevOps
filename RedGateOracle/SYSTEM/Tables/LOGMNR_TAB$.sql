CREATE TABLE "SYSTEM".logmnr_tab$ (
  ts# NUMBER(22),
  cols NUMBER(22),
  property NUMBER,
  intcols NUMBER(22),
  kernelcols NUMBER(22),
  bobj# NUMBER(22),
  trigflag NUMBER(22),
  flags NUMBER(22),
  obj# NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  acdrflags NUMBER,
  acdrtsobj# NUMBER,
  acdrrowtsintcol# NUMBER,
  CONSTRAINT logmnr_tab$_pk PRIMARY KEY (logmnr_uid,obj#) DISABLE NOVALIDATE
);