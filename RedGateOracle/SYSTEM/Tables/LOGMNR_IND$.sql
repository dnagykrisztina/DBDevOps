CREATE TABLE "SYSTEM".logmnr_ind$ (
  bo# NUMBER(22),
  cols NUMBER(22),
  type# NUMBER(22),
  flags NUMBER,
  property NUMBER,
  obj# NUMBER(22) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_ind$_pk PRIMARY KEY (logmnr_uid,obj#) DISABLE NOVALIDATE
);