CREATE TABLE "SYSTEM".mview$_adv_rollup (
  runid# NUMBER NOT NULL,
  clevelid# NUMBER NOT NULL,
  plevelid# NUMBER NOT NULL,
  flags NUMBER NOT NULL,
  CONSTRAINT mview$_adv_rollup_pk PRIMARY KEY (runid#,clevelid#,plevelid#),
  CONSTRAINT mview$_adv_rollup_cfk FOREIGN KEY (runid#,clevelid#) REFERENCES "SYSTEM".mview$_adv_level (runid#,levelid#),
  CONSTRAINT mview$_adv_rollup_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#),
  CONSTRAINT mview$_adv_rollup_pfk FOREIGN KEY (runid#,plevelid#) REFERENCES "SYSTEM".mview$_adv_level (runid#,levelid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_rollup IS 'Each row repesents either a functional dependency or join-key relationship';