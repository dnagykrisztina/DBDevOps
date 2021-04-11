CREATE TABLE "SYSTEM".sqlplus_product_profile (
  product VARCHAR2(30 BYTE) NOT NULL,
  userid VARCHAR2(128 BYTE),
  "ATTRIBUTE" VARCHAR2(240 BYTE),
  "SCOPE" VARCHAR2(240 BYTE),
  numeric_value NUMBER(15,2),
  char_value VARCHAR2(240 BYTE),
  date_value DATE,
  long_value LONG
);