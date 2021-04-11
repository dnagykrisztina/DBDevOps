CREATE TABLE "SYSTEM".logstdby$skip_transaction (
  xidusn NUMBER,
  xidslt NUMBER,
  xidsqn NUMBER,
  "ACTIVE" NUMBER,
  commit_scn NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(2000 BYTE),
  con_name VARCHAR2(384 BYTE)
);