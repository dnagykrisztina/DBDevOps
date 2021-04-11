CREATE TABLE "SYSTEM".mview$_adv_parameters (
  parameter_name VARCHAR2(128 BYTE) NOT NULL,
  parameter_type NUMBER NOT NULL,
  string_value VARCHAR2(30 BYTE),
  date_value DATE,
  numerical_value NUMBER,
  CONSTRAINT mview$_adv_parameters_pk PRIMARY KEY (parameter_name)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_parameters IS 'Summary advisor tuning parameters';