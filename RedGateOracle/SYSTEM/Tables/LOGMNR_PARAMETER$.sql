CREATE TABLE "SYSTEM".logmnr_parameter$ (
  session# NUMBER NOT NULL,
  "NAME" VARCHAR2(384 BYTE) NOT NULL,
  "VALUE" VARCHAR2(2000 BYTE),
  "TYPE" NUMBER,
  "SCN" NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(2000 BYTE)
);