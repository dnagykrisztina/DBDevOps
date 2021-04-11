CREATE TABLE "SYSTEM".mview$_adv_filterinstance (
  runid# NUMBER NOT NULL,
  filterid# NUMBER,
  subfilternum# NUMBER,
  subfiltertype NUMBER,
  str_value VARCHAR2(1028 BYTE),
  num_value1 NUMBER,
  num_value2 NUMBER,
  date_value1 DATE,
  date_value2 DATE,
  CONSTRAINT mview$_adv_filterinstance_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_filterinstance IS 'Table for workload filter instance definition';