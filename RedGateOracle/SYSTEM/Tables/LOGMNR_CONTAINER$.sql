CREATE TABLE "SYSTEM".logmnr_container$ (
  obj# NUMBER NOT NULL,
  con_id# NUMBER NOT NULL,
  dbid NUMBER NOT NULL,
  con_uid NUMBER NOT NULL,
  create_scnwrp NUMBER NOT NULL,
  create_scnbas NUMBER NOT NULL,
  flags NUMBER,
  status NUMBER NOT NULL,
  logmnr_uid NUMBER(22),
  logmnr_flags NUMBER(22),
  vsn NUMBER,
  fed_root_con_id# NUMBER,
  CONSTRAINT logmnr_container$_pk PRIMARY KEY (logmnr_uid,obj#) DISABLE NOVALIDATE
);