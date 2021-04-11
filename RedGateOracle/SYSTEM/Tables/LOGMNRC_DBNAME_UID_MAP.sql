CREATE TABLE "SYSTEM".logmnrc_dbname_uid_map (
  "GLOBAL_NAME" VARCHAR2(384 BYTE) NOT NULL,
  logmnr_uid NUMBER,
  flags NUMBER,
  pdb_name VARCHAR2(384 BYTE),
  logmnr_mdh NUMBER NOT NULL,
  CONSTRAINT logmnrc_dbname_uid_map_pk PRIMARY KEY ("GLOBAL_NAME",logmnr_mdh)
);