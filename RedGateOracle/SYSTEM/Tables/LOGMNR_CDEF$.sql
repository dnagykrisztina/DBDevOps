CREATE TABLE "SYSTEM".logmnr_cdef$ (
  con# NUMBER,
  cols NUMBER,
  type# NUMBER,
  robj# NUMBER,
  rcon# NUMBER,
  enabled NUMBER,
  defer NUMBER,
  obj# NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_cdef$_pk PRIMARY KEY (logmnr_uid,con#) DISABLE NOVALIDATE
);