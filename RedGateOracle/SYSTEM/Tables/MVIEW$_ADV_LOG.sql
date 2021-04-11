CREATE TABLE "SYSTEM".mview$_adv_log (
  runid# NUMBER NOT NULL,
  filterid# NUMBER,
  run_begin DATE,
  run_end DATE,
  run_type NUMBER,
  uname VARCHAR2(128 BYTE),
  status NUMBER NOT NULL,
  message VARCHAR2(2000 BYTE),
  completed NUMBER,
  total NUMBER,
  error_code VARCHAR2(20 BYTE),
  CONSTRAINT mview$_adv_log_pk PRIMARY KEY (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_log IS 'Log all calls to summary advisory functions';