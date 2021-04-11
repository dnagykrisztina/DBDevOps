CREATE TABLE "SYSTEM".logmnr_processed_log$ (
  session# NUMBER NOT NULL,
  thread# NUMBER NOT NULL,
  sequence# NUMBER,
  first_change# NUMBER,
  next_change# NUMBER,
  first_time DATE,
  next_time DATE,
  file_name VARCHAR2(513 BYTE),
  status NUMBER,
  info VARCHAR2(32 BYTE),
  "TIMESTAMP" DATE,
  CONSTRAINT logmnr_processed_log$_pk PRIMARY KEY (session#,thread#)
);