CREATE TABLE "SYSTEM".logmnr_restart_ckpt_txinfo$ (
  session# NUMBER NOT NULL,
  xidusn NUMBER NOT NULL,
  xidslt NUMBER NOT NULL,
  xidsqn NUMBER NOT NULL,
  session_num NUMBER NOT NULL,
  serial_num NUMBER NOT NULL,
  flag NUMBER,
  start_scn NUMBER,
  effective_scn NUMBER NOT NULL,
  "OFFSET" NUMBER,
  tx_data BLOB,
  CONSTRAINT logmnr_restart_ckpt_txinfo$_pk PRIMARY KEY (session#,xidusn,xidslt,xidsqn,session_num,serial_num,effective_scn)
);