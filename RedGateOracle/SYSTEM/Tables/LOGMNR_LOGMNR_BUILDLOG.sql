CREATE TABLE "SYSTEM".logmnr_logmnr_buildlog (
  build_date VARCHAR2(20 BYTE),
  db_txn_scnbas NUMBER,
  db_txn_scnwrp NUMBER,
  current_build_state NUMBER,
  completion_status NUMBER,
  marked_log_file_low_scn NUMBER,
  initial_xid VARCHAR2(22 BYTE) NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  cdb_xid VARCHAR2(22 BYTE),
  spare1 NUMBER,
  spare2 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnr_logmnr_buildlog_pk PRIMARY KEY (logmnr_uid,initial_xid) DISABLE NOVALIDATE
);