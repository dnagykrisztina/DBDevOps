CREATE TABLE "SYSTEM".mview$_adv_fjg (
  fjgid# NUMBER NOT NULL,
  ajgid# NUMBER NOT NULL,
  fjgdeslen NUMBER NOT NULL,
  fjgdes LONG RAW NOT NULL,
  hashvalue NUMBER NOT NULL,
  frequency NUMBER,
  CONSTRAINT mview$_adv_fjg_pk PRIMARY KEY (fjgid#),
  CONSTRAINT mview$_adv_fjg_fk FOREIGN KEY (ajgid#) REFERENCES "SYSTEM".mview$_adv_ajg (ajgid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_fjg IS 'Representation for query join sub-graph not in AJG ';