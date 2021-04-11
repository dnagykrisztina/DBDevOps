CREATE TABLE "SYSTEM".rolling$events (
  eventid NUMBER,
  instid NUMBER,
  revision NUMBER,
  event_time TIMESTAMP,
  "TYPE" VARCHAR2(16 BYTE),
  status NUMBER,
  message VARCHAR2(256 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(128 BYTE)
);