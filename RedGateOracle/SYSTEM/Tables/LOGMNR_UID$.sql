CREATE TABLE "SYSTEM".logmnr_uid$ (
  logmnr_uid NUMBER(22) NOT NULL,
  logmnr_did NUMBER,
  logmnr_mdh NUMBER,
  pdb_name VARCHAR2(384 BYTE),
  pdb_id NUMBER,
  pdb_uid NUMBER,
  start_scn NUMBER,
  end_scn NUMBER,
  flags NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  spare4 TIMESTAMP,
  CONSTRAINT logmnr_uid$_pk PRIMARY KEY (logmnr_uid)
);