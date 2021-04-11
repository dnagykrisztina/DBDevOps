CREATE GLOBAL TEMPORARY TABLE "SYSTEM".logmnr_gt_tab_include$ (
  schema_name VARCHAR2(390 BYTE),
  table_name VARCHAR2(390 BYTE),
  pdb_name VARCHAR2(390 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE)
)
ON COMMIT PRESERVE ROWS;