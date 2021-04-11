CREATE TABLE "SYSTEM".model_details (
  modelid NUMBER(5) NOT NULL,
  maker NUMBER(5),
  "MODEL" VARCHAR2(25 BYTE),
  CONSTRAINT model_details_id_pk PRIMARY KEY (modelid),
  CONSTRAINT model_unique UNIQUE ("MODEL"),
  CONSTRAINT model_maker_fk FOREIGN KEY (maker) REFERENCES "SYSTEM".car_makers ("ID")
);