CREATE TABLE "SYSTEM".mview$_adv_level (
  runid# NUMBER NOT NULL,
  levelid# NUMBER NOT NULL,
  dimobj# NUMBER,
  flags NUMBER NOT NULL,
  tblobj# NUMBER NOT NULL,
  columnlist RAW(70) NOT NULL,
  levelname VARCHAR2(128 BYTE),
  CONSTRAINT mview$_adv_level_pk PRIMARY KEY (runid#,levelid#),
  CONSTRAINT mview$_adv_level_fk FOREIGN KEY (runid#) REFERENCES "SYSTEM".mview$_adv_log (runid#)
);
COMMENT ON TABLE "SYSTEM".mview$_adv_level IS 'Level definition';