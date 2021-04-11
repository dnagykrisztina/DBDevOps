CREATE TABLE "SYSTEM".car_details (
  "ID" NUMBER(5) NOT NULL,
  mpg NUMBER(5,2),
  cylinders NUMBER(5),
  edispl NUMBER(10),
  weight NUMBER(10),
  accel NUMBER(10,2),
  "YEAR" NUMBER(10),
  horsepower2 NUMBER(*,0),
  color VARCHAR2(25 BYTE),
  CONSTRAINT car_details_id_pk PRIMARY KEY ("ID"),
  CONSTRAINT car_details_id_fk FOREIGN KEY ("ID") REFERENCES "SYSTEM".car_names ("ID")
);