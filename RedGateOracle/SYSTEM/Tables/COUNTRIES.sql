CREATE TABLE "SYSTEM".countries (
  countryid NUMBER(5) NOT NULL,
  countryname VARCHAR2(20 BYTE),
  continent NUMBER(5),
  CONSTRAINT country_id_pk PRIMARY KEY (countryid),
  CONSTRAINT country_continent_id_fk FOREIGN KEY (continent) REFERENCES "SYSTEM".continents (contid)
);