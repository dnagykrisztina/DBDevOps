CREATE TABLE "SYSTEM".logmnr_log$ (
  session# NUMBER NOT NULL,
  thread# NUMBER NOT NULL,
  sequence# NUMBER NOT NULL,
  first_change# NUMBER NOT NULL,
  next_change# NUMBER,
  first_time DATE,
  next_time DATE,
  file_name VARCHAR2(513 BYTE),
  status NUMBER,
  info VARCHAR2(32 BYTE),
  "TIMESTAMP" DATE,
  dict_begin VARCHAR2(3 BYTE),
  dict_end VARCHAR2(3 BYTE),
  status_info VARCHAR2(32 BYTE),
  db_id NUMBER NOT NULL,
  resetlogs_change# NUMBER NOT NULL,
  reset_timestamp NUMBER NOT NULL,
  prev_resetlogs_change# NUMBER,
  prev_reset_timestamp NUMBER,
  "BLOCKS" NUMBER,
  block_size NUMBER,
  flags NUMBER,
  "CONTENTS" NUMBER,
  recid NUMBER,
  recstamp NUMBER,
  mark_delete_timestamp NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 NUMBER,
  spare4 NUMBER,
  spare5 NUMBER,
  CONSTRAINT logmnr_log$_pk PRIMARY KEY (session#,thread#,sequence#,first_change#,db_id,resetlogs_change#,reset_timestamp)
);