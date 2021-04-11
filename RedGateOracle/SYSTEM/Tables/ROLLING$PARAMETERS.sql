CREATE TABLE "SYSTEM".rolling$parameters (
  "SCOPE" NUMBER,
  "NAME" VARCHAR2(32 BYTE),
  "ID" NUMBER,
  descrip VARCHAR2(256 BYTE),
  "TYPE" NUMBER,
  datatype NUMBER,
  "ATTRIBUTES" NUMBER,
  curval VARCHAR2(1024 BYTE),
  lstval VARCHAR2(1024 BYTE),
  defval VARCHAR2(1024 BYTE),
  minval NUMBER,
  maxval NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(128 BYTE)
);