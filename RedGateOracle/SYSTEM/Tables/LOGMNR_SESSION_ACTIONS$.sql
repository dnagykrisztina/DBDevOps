CREATE TABLE "SYSTEM".logmnr_session_actions$ (
  flagsruntime NUMBER DEFAULT 0,
  dropscn NUMBER,
  modifytime TIMESTAMP,
  dispatchtime TIMESTAMP,
  droptime TIMESTAMP,
  lcrcount NUMBER DEFAULT 0,
  actionname VARCHAR2(30 BYTE) NOT NULL,
  logmnrsession# NUMBER NOT NULL,
  processrole# NUMBER NOT NULL,
  actiontype# NUMBER NOT NULL,
  flagsdefinetime NUMBER,
  createtime TIMESTAMP,
  xidusn NUMBER,
  xidslt NUMBER,
  xidsqn NUMBER,
  thread# NUMBER,
  startscn NUMBER,
  startsubscn NUMBER,
  endscn NUMBER,
  endsubscn NUMBER,
  rbasqn NUMBER,
  rbablk NUMBER,
  rbabyte NUMBER,
  session# NUMBER,
  obj# NUMBER,
  attr1 NUMBER,
  attr2 NUMBER,
  attr3 NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 TIMESTAMP,
  spare4 VARCHAR2(2000 BYTE),
  pdbid NUMBER,
  pdb_name VARCHAR2(390 BYTE),
  CONSTRAINT logmnr_session_action$_pk PRIMARY KEY (logmnrsession#,actionname)
);