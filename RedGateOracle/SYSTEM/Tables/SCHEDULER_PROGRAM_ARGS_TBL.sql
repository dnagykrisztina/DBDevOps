CREATE TABLE "SYSTEM".scheduler_program_args_tbl (
  "OWNER" VARCHAR2(128 BYTE) NOT NULL,
  program_name VARCHAR2(128 BYTE) NOT NULL,
  argument_name VARCHAR2(128 BYTE),
  argument_position NUMBER NOT NULL,
  argument_type VARCHAR2(257 BYTE),
  metadata_attribute VARCHAR2(19 BYTE),
  default_value VARCHAR2(4000 BYTE),
  default_anydata_value sys.anydata,
  out_argument VARCHAR2(5 BYTE)
);