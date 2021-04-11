CREATE TABLE "SYSTEM".logmnr_spill$ (
  session# NUMBER NOT NULL,
  xidusn NUMBER NOT NULL,
  xidslt NUMBER NOT NULL,
  xidsqn NUMBER NOT NULL,
  "CHUNK" NUMBER NOT NULL,
  startidx NUMBER NOT NULL,
  endidx NUMBER NOT NULL,
  flag NUMBER NOT NULL,
  sequence# NUMBER NOT NULL,
  spill_data BLOB,
  spare1 NUMBER,
  spare2 NUMBER,
  pdbid NUMBER NOT NULL,
  CONSTRAINT logmnr_spill$_pk PRIMARY KEY (session#,pdbid,xidusn,xidslt,xidsqn,"CHUNK",startidx,endidx,flag,sequence#)
);