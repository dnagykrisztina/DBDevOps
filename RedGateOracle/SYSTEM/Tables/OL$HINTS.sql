CREATE GLOBAL TEMPORARY TABLE "SYSTEM".ol$hints (
  ol_name VARCHAR2(128 BYTE),
  hint# NUMBER,
  "CATEGORY" VARCHAR2(128 BYTE),
  hint_type NUMBER,
  hint_text VARCHAR2(512 BYTE),
  stage# NUMBER,
  node# NUMBER,
  table_name VARCHAR2(128 BYTE),
  table_tin NUMBER,
  table_pos NUMBER,
  ref_id NUMBER,
  user_table_name VARCHAR2(260 BYTE),
  "COST" FLOAT,
  "CARDINALITY" FLOAT,
  bytes FLOAT,
  hint_textoff NUMBER,
  hint_textlen NUMBER,
  join_pred VARCHAR2(2000 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  hint_string CLOB
)
ON COMMIT PRESERVE ROWS;