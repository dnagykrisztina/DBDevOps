CREATE TABLE "SYSTEM".mview$_adv_journal (
  runid# NUMBER NOT NULL,
  seq# NUMBER NOT NULL,
  "TIMESTAMP" DATE NOT NULL,
  flags NUMBER NOT NULL,
  num NUMBER,
  "TEXT" LONG,
  textlen NUMBER,
  CONSTRAINT mview$_adv_journal_pk PRIMARY KEY (runid#,seq#),
  CONSTRAINT mview$_adv_journal_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_journal IS 'Summary advisor journal table for debugging and information';