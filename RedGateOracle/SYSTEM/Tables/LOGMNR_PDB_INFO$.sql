CREATE TABLE "SYSTEM".logmnr_pdb_info$ (
  logmnr_did NUMBER NOT NULL,
  logmnr_mdh NUMBER NOT NULL,
  pdb_name VARCHAR2(384 BYTE),
  pdb_id NUMBER,
  pdb_uid NUMBER,
  plugin_scn NUMBER NOT NULL,
  unplug_scn NUMBER,
  flags NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  spare4 TIMESTAMP,
  pdb_global_name VARCHAR2(384 BYTE),
  CONSTRAINT logmnr_pdb_info$_pk PRIMARY KEY (logmnr_did,logmnr_mdh,plugin_scn)
);