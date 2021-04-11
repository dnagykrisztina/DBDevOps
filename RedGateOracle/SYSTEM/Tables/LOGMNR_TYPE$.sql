CREATE TABLE "SYSTEM".logmnr_type$ (
  version# NUMBER,
  "VERSION" VARCHAR2(384 BYTE),
  tvoid RAW(16),
  typecode NUMBER,
  properties NUMBER,
  "ATTRIBUTES" NUMBER,
  methods NUMBER,
  hiddenmethods NUMBER,
  supertypes NUMBER,
  subtypes NUMBER,
  externtype NUMBER,
  externname VARCHAR2(4000 BYTE),
  helperclassname VARCHAR2(4000 BYTE),
  local_attrs NUMBER,
  local_methods NUMBER,
  typeid RAW(16),
  roottoid RAW(16),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 NUMBER,
  supertoid RAW(16),
  hashcode RAW(17),
  toid RAW(16) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_type$_pk PRIMARY KEY (logmnr_uid,toid,version#) DISABLE NOVALIDATE
);