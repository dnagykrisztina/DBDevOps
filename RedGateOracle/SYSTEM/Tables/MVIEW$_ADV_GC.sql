CREATE TABLE "SYSTEM".mview$_adv_gc (
  gcid# NUMBER NOT NULL,
  fjgid# NUMBER NOT NULL,
  gcdeslen NUMBER NOT NULL,
  gcdes LONG RAW NOT NULL,
  hashvalue NUMBER NOT NULL,
  frequency NUMBER,
  CONSTRAINT mview$_adv_gc_pk PRIMARY KEY (gcid#),
  CONSTRAINT mview$_adv_gc_fk FOREIGN KEY (fjgid#) REFERENCES "SYSTEM".mview$_adv_fjg (fjgid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_gc IS 'Group-by columns of a query';