CREATE TABLE "SYSTEM".mview$_adv_filter (
  filterid# NUMBER NOT NULL,
  subfilternum# NUMBER NOT NULL,
  subfiltertype NUMBER NOT NULL,
  str_value VARCHAR2(1028 BYTE),
  num_value1 NUMBER,
  num_value2 NUMBER,
  date_value1 DATE,
  date_value2 DATE,
  CONSTRAINT mview$_adv_filter_pk PRIMARY KEY (filterid#,subfilternum#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_filter IS 'Table for workload filter definition';