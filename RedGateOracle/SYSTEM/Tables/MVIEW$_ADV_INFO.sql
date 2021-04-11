CREATE TABLE "SYSTEM".mview$_adv_info (
  runid# NUMBER NOT NULL,
  seq# NUMBER NOT NULL,
  "TYPE" NUMBER NOT NULL,
  infolen NUMBER NOT NULL,
  info LONG RAW,
  status NUMBER,
  flag NUMBER,
  CONSTRAINT mview$_adv_info_pk PRIMARY KEY (runid#,seq#),
  CONSTRAINT mview$_adv_info_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_info IS 'Internal table for passing information from the SQL analyzer';