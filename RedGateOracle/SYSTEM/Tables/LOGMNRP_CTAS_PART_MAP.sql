CREATE TABLE "SYSTEM".logmnrp_ctas_part_map (
  logmnr_uid NUMBER NOT NULL,
  baseobj# NUMBER NOT NULL,
  baseobjv# NUMBER NOT NULL,
  keyobj# NUMBER NOT NULL,
  part# NUMBER NOT NULL,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(1000 BYTE),
  CONSTRAINT logmnrp_ctas_part_map_pk PRIMARY KEY (logmnr_uid,baseobjv#,keyobj#)
);