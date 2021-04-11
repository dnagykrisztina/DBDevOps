CREATE GLOBAL TEMPORARY TABLE "SYSTEM".logmnr_gt_xid_include$ (
  xidusn NUMBER,
  xidslt NUMBER,
  xidsqn NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(4000 BYTE),
  pdbid NUMBER,
  pdb_name VARCHAR2(390 BYTE)
)
ON COMMIT PRESERVE ROWS;