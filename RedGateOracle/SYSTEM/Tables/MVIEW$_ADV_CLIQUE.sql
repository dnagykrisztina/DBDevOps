CREATE TABLE "SYSTEM".mview$_adv_clique (
  cliqueid# NUMBER NOT NULL,
  runid# NUMBER NOT NULL,
  cliquedeslen NUMBER NOT NULL,
  cliquedes LONG RAW NOT NULL,
  hashvalue NUMBER NOT NULL,
  frequency NUMBER NOT NULL,
  bytecost NUMBER NOT NULL,
  rowsize NUMBER NOT NULL,
  numrows NUMBER NOT NULL,
  CONSTRAINT mview$_adv_clique_pk PRIMARY KEY (cliqueid#),
  CONSTRAINT mview$_adv_clique_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_clique IS 'Table for storing canonical form of Clique queries';