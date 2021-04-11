CREATE TABLE "SYSTEM".logmnr_dictstate$ (
  logmnr_uid NUMBER(22),
  start_scnbas NUMBER,
  start_scnwrp NUMBER,
  end_scnbas NUMBER,
  end_scnwrp NUMBER,
  redo_thread NUMBER,
  rbasqn NUMBER,
  rbablk NUMBER,
  rbabyte NUMBER,
  logmnr_flags NUMBER(22),
  CONSTRAINT logmnr_dictstate$_pk PRIMARY KEY (logmnr_uid) DISABLE NOVALIDATE
);