CREATE GLOBAL TEMPORARY TABLE "SYSTEM".logmnr_gt_user_include$ (
  user_name VARCHAR2(390 BYTE),
  user_type NUMBER,
  pdb_name VARCHAR2(390 BYTE),
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE)
)
ON COMMIT PRESERVE ROWS;