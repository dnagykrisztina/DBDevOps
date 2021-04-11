CREATE TABLE "SYSTEM".rolling$directives (
  directid NUMBER,
  phase NUMBER,
  taskid NUMBER,
  feature VARCHAR2(32 BYTE),
  description VARCHAR2(256 BYTE),
  target NUMBER,
  flags VARCHAR2(64 BYTE),
  "OPCODE" NUMBER,
  p1 VARCHAR2(256 BYTE),
  p2 VARCHAR2(256 BYTE),
  p3 VARCHAR2(256 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(256 BYTE)
);