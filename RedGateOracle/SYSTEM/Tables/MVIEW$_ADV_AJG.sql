CREATE TABLE "SYSTEM".mview$_adv_ajg (
  ajgid# NUMBER NOT NULL,
  runid# NUMBER NOT NULL,
  ajgdeslen NUMBER NOT NULL,
  ajgdes LONG RAW NOT NULL,
  hashvalue NUMBER NOT NULL,
  frequency NUMBER,
  CONSTRAINT mview$_adv_ajg_pk PRIMARY KEY (ajgid#),
  CONSTRAINT mview$_adv_ajg_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_ajg IS 'Anchor-join graph representation';