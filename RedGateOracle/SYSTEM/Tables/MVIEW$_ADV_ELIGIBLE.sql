CREATE TABLE "SYSTEM".mview$_adv_eligible (
  sumobjn# NUMBER NOT NULL,
  runid# NUMBER NOT NULL,
  bytecost NUMBER NOT NULL,
  flags NUMBER NOT NULL,
  frequency NUMBER NOT NULL,
  CONSTRAINT mview$_adv_eligible_pk PRIMARY KEY (sumobjn#,runid#),
  CONSTRAINT mview$_adv_eligible_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_eligible IS 'Summary management rewrite eligibility information';