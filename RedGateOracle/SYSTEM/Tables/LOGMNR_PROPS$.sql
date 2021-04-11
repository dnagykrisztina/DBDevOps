CREATE TABLE "SYSTEM".logmnr_props$ (
  value$ VARCHAR2(4000 BYTE),
  comment$ VARCHAR2(4000 BYTE),
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_props$_pk PRIMARY KEY (logmnr_uid,"NAME") DISABLE NOVALIDATE
);