CREATE TABLE "SYSTEM".car_makers (
  "ID" NUMBER(5) NOT NULL,
  maker VARCHAR2(15 BYTE),
  fullname VARCHAR2(25 BYTE),
  country NUMBER(5),
  CONSTRAINT car_maker_id PRIMARY KEY ("ID"),
  CONSTRAINT car_maker_country_id_fk FOREIGN KEY (country) REFERENCES "SYSTEM".countries (countryid)
);