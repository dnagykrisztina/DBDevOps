CREATE TABLE "SYSTEM".car_names (
  "ID" NUMBER(5) NOT NULL,
  "MODEL" VARCHAR2(25 BYTE),
  descr VARCHAR2(40 BYTE),
  CONSTRAINT car_names_id_pk PRIMARY KEY ("ID"),
  CONSTRAINT car_names_model_fk FOREIGN KEY ("MODEL") REFERENCES "SYSTEM".model_details ("MODEL")
);