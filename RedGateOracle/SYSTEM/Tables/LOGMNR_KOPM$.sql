CREATE TABLE "SYSTEM".logmnr_kopm$ (
  "LENGTH" NUMBER,
  "METADATA" RAW(255),
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_kopm$_pk PRIMARY KEY (logmnr_uid,"NAME") DISABLE NOVALIDATE
);