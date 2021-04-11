CREATE TABLE "SYSTEM".logmnrc_seq_gg (
  logmnr_uid NUMBER NOT NULL,
  obj# NUMBER NOT NULL,
  commit_scn NUMBER NOT NULL,
  drop_scn NUMBER,
  seq_flags NUMBER NOT NULL,
  owner# NUMBER NOT NULL,
  ownername VARCHAR2(384 BYTE) NOT NULL,
  objname VARCHAR2(384 BYTE) NOT NULL,
  seqcache NUMBER,
  seqinc NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  spare4 VARCHAR2(4000 BYTE),
  CONSTRAINT logmnrc_seq_gg_pk PRIMARY KEY (logmnr_uid,obj#,commit_scn)
);