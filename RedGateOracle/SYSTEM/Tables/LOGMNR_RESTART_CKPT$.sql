CREATE TABLE "SYSTEM".logmnr_restart_ckpt$ (
  session# NUMBER NOT NULL,
  valid NUMBER,
  ckpt_scn NUMBER NOT NULL,
  xidusn NUMBER NOT NULL,
  xidslt NUMBER NOT NULL,
  xidsqn NUMBER NOT NULL,
  session_num NUMBER NOT NULL,
  serial_num NUMBER NOT NULL,
  ckpt_info BLOB,
  flag NUMBER,
  "OFFSET" NUMBER,
  client_data BLOB,
  spare1 NUMBER,
  spare2 NUMBER,
  pdbid NUMBER NOT NULL,
  CONSTRAINT logmnr_restart_ckpt$_pk PRIMARY KEY (session#,ckpt_scn,xidusn,xidslt,xidsqn,pdbid,session_num,serial_num)
);