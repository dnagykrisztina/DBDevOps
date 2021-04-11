CREATE TABLE "SYSTEM".logstdby$flashback_scn (
  primary_scn NUMBER NOT NULL,
  primary_time DATE,
  standby_scn NUMBER,
  standby_time DATE,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 DATE,
  PRIMARY KEY (primary_scn)
);