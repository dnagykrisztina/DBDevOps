CREATE TABLE "SYSTEM".mview$_adv_exceptions (
  runid# NUMBER,
  "OWNER" VARCHAR2(128 BYTE),
  table_name VARCHAR2(128 BYTE),
  dimension_name VARCHAR2(128 BYTE),
  relationship VARCHAR2(11 BYTE),
  bad_rowid ROWID,
  CONSTRAINT mview$_adv_exception_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_exceptions IS 'Output table for dimension validations';