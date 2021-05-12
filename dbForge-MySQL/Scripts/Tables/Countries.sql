CREATE TABLE Countries (
  CountryID INT NOT NULL,
  CountryName VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Continent INT DEFAULT NULL,
  PRIMARY KEY (CountryID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
ROW_FORMAT = DYNAMIC;

ALTER TABLE Countries 
  ADD CONSTRAINT country_continent_id_fk FOREIGN KEY (Continent)
    REFERENCES Continents(ContID);