CREATE TABLE "SYSTEM".logmnr_integrated_spill$ (
  session# NUMBER NOT NULL,
  xidusn NUMBER NOT NULL,
  xidslt NUMBER NOT NULL,
  xidsqn NUMBER NOT NULL,
  "CHUNK" NUMBER NOT NULL,
  flag NUMBER NOT NULL,
  ctime DATE,
  mtime DATE,
  spill_data BLOB,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 NUMBER,
  spare4 DATE,
  spare5 DATE,
  CONSTRAINT logmnr_integ_spill$_pk PRIMARY KEY (session#,xidusn,xidslt,xidsqn,"CHUNK",flag)
);