-- liquibase formatted sql changeLogId:038f537c-e355-4d7a-ad25-f114a51c5c66
--changeset author:dnagykrisztina labels:deleteForeignKey_from_Countries
ALTER TABLE Cars.Countries DROP CONSTRAINT country_continent_id_fk;
ALTER TABLE Cars.Countries DROP COLUMN Continent;