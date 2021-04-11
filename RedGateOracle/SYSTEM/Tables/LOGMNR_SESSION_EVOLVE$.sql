CREATE TABLE "SYSTEM".logmnr_session_evolve$ (
  branch_level NUMBER,
  session# NUMBER NOT NULL,
  db_id NUMBER NOT NULL,
  reset_scn NUMBER NOT NULL,
  reset_timestamp NUMBER NOT NULL,
  prev_reset_scn NUMBER,
  prev_reset_timestamp NUMBER,
  status NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 NUMBER,
  spare4 DATE,
  CONSTRAINT logmnr_session_evolve$_pk PRIMARY KEY (session#,db_id,reset_scn,reset_timestamp)
);