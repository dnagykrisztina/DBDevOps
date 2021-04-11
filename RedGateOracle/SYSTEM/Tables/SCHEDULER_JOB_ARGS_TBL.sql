CREATE TABLE "SYSTEM".scheduler_job_args_tbl (
  "OWNER" VARCHAR2(128 BYTE),
  job_name VARCHAR2(128 BYTE),
  argument_name VARCHAR2(128 BYTE),
  argument_position NUMBER,
  argument_type VARCHAR2(257 BYTE),
  "VALUE" VARCHAR2(4000 BYTE),
  anydata_value sys.anydata,
  out_argument VARCHAR2(5 BYTE)
);