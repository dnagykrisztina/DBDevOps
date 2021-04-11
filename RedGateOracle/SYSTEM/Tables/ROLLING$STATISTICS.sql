CREATE TABLE "SYSTEM".rolling$statistics (
  statid NUMBER,
  rdbid NUMBER,
  "ATTRIBUTES" NUMBER,
  "TYPE" NUMBER,
  "NAME" VARCHAR2(256 BYTE),
  valuestr VARCHAR2(256 BYTE),
  valuenum NUMBER,
  valuets TIMESTAMP,
  valueint INTERVAL DAY(3) TO SECOND(2),
  update_time TIMESTAMP,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(128 BYTE)
);