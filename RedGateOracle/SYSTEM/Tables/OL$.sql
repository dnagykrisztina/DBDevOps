CREATE GLOBAL TEMPORARY TABLE "SYSTEM".ol$ (
  ol_name VARCHAR2(128 BYTE),
  sql_text LONG,
  textlen NUMBER,
  signature RAW(16),
  hash_value NUMBER,
  hash_value2 NUMBER,
  "CATEGORY" VARCHAR2(128 BYTE),
  "VERSION" VARCHAR2(64 BYTE),
  creator VARCHAR2(128 BYTE),
  "TIMESTAMP" DATE,
  flags NUMBER,
  hintcount NUMBER,
  spare1 NUMBER,
  spare2 VARCHAR2(1000 BYTE)
)
ON COMMIT PRESERVE ROWS;