CREATE TABLE "SYSTEM".logstdby$events (
  event_time TIMESTAMP NOT NULL,
  current_scn NUMBER,
  commit_scn NUMBER,
  xidusn NUMBER,
  xidslt NUMBER,
  xidsqn NUMBER,
  errval NUMBER,
  event VARCHAR2(2000 BYTE),
  full_event CLOB,
  "ERROR" VARCHAR2(2000 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(2000 BYTE),
  con_name VARCHAR2(30 BYTE),
  "CON_ID" NUMBER
);