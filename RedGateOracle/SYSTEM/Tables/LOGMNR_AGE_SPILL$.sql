CREATE TABLE "SYSTEM".logmnr_age_spill$ (
  session# NUMBER NOT NULL,
  xidusn NUMBER NOT NULL,
  xidslt NUMBER NOT NULL,
  xidsqn NUMBER NOT NULL,
  "CHUNK" NUMBER NOT NULL,
  sequence# NUMBER NOT NULL,
  "OFFSET" NUMBER,
  spill_data BLOB,
  spare1 NUMBER,
  spare2 NUMBER,
  pdbid NUMBER NOT NULL,
  CONSTRAINT logmnr_age_spill$_pk PRIMARY KEY (session#,pdbid,xidusn,xidslt,xidsqn,"CHUNK",sequence#)
);