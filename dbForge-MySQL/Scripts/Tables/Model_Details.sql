CREATE TABLE Model_Details (
  ModelID INT NOT NULL,
  Maker INT DEFAULT NULL,
  Model VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (ModelID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 455,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
ROW_FORMAT = DYNAMIC;

ALTER TABLE Model_Details 
  ADD UNIQUE INDEX model_unique(Model);

ALTER TABLE Model_Details 
  ADD CONSTRAINT model_maker_fk FOREIGN KEY (Maker)
    REFERENCES Car_Makers(ID);