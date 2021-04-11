CREATE TABLE "SYSTEM".logstdby$history (
  stream_sequence# NUMBER,
  lmnr_sid NUMBER,
  dbid NUMBER,
  first_change# NUMBER,
  last_change# NUMBER,
  "SOURCE" NUMBER,
  status NUMBER,
  first_time DATE,
  last_time DATE,
  dgname VARCHAR2(255 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(2000 BYTE)
);