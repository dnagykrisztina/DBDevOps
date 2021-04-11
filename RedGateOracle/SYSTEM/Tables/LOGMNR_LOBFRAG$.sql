CREATE TABLE "SYSTEM".logmnr_lobfrag$ (
  fragobj# NUMBER,
  parentobj# NUMBER,
  tabfragobj# NUMBER,
  indfragobj# NUMBER,
  frag# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_lobfrag$_pk PRIMARY KEY (logmnr_uid,fragobj#) DISABLE NOVALIDATE
);