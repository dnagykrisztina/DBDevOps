CREATE GLOBAL TEMPORARY TABLE "SYSTEM".logmnrt_mddl$ (
  source_obj# NUMBER NOT NULL,
  source_rowid ROWID NOT NULL,
  dest_rowid ROWID NOT NULL,
  CONSTRAINT logmnrt_mddl$_pk PRIMARY KEY (source_obj#,source_rowid)
)
ON COMMIT DELETE ROWS;