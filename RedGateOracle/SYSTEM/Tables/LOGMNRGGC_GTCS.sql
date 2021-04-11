CREATE TABLE "SYSTEM".logmnrggc_gtcs (
  logmnr_uid NUMBER NOT NULL,
  obj# NUMBER NOT NULL,
  objv# NUMBER NOT NULL,
  segcol# NUMBER NOT NULL,
  intcol# NUMBER NOT NULL,
  colname VARCHAR2(384 BYTE) NOT NULL,
  type# NUMBER NOT NULL,
  "LENGTH" NUMBER,
  "PRECISION" NUMBER,
  "SCALE" NUMBER,
  interval_leading_precision NUMBER,
  interval_trailing_precision NUMBER,
  property NUMBER,
  toid RAW(16),
  charsetid NUMBER,
  charsetform NUMBER,
  typename VARCHAR2(384 BYTE),
  fqcolname VARCHAR2(4000 BYTE),
  numintcols NUMBER,
  numattrs NUMBER,
  adtorder NUMBER,
  logmnr_spare1 NUMBER,
  logmnr_spare2 NUMBER,
  logmnr_spare3 VARCHAR2(1000 BYTE),
  logmnr_spare4 DATE,
  logmnr_spare5 NUMBER,
  logmnr_spare6 NUMBER,
  logmnr_spare7 NUMBER,
  logmnr_spare8 NUMBER,
  logmnr_spare9 NUMBER,
  col# NUMBER,
  xtypeschemaname VARCHAR2(384 BYTE),
  xtypename VARCHAR2(4000 BYTE),
  xfqcolname VARCHAR2(4000 BYTE),
  xtopintcol NUMBER,
  xreffedtableobjn NUMBER,
  xreffedtableobjv NUMBER,
  xcoltypeflags NUMBER,
  xopqtypetype NUMBER,
  xopqtypeflags NUMBER,
  xopqlobintcol NUMBER,
  xopqobjintcol NUMBER,
  xxmlintcol NUMBER,
  eaowner# NUMBER,
  eamkeyid VARCHAR2(192 BYTE),
  eaencalg NUMBER,
  eaintalg NUMBER,
  eacolklc RAW(2000),
  eaklclen NUMBER,
  eaflags NUMBER,
  logmnrderivedflags NUMBER,
  collid NUMBER,
  collintcol# NUMBER,
  acdrrescol# NUMBER,
  CONSTRAINT logmnrggc_gtcs_pk PRIMARY KEY (logmnr_uid,obj#,objv#,intcol#)
);