CREATE GLOBAL TEMPORARY TABLE "SYSTEM".ol$nodes (
  ol_name VARCHAR2(128 BYTE),
  "CATEGORY" VARCHAR2(128 BYTE),
  node_id NUMBER,
  parent_id NUMBER,
  node_type NUMBER,
  node_textlen NUMBER,
  node_textoff NUMBER,
  node_name VARCHAR2(64 BYTE)
)
ON COMMIT PRESERVE ROWS;