[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[Compare](../Compare.md)>[Tables](Tables.md)>Countries


# ![logo](../../../../../Images/table64.svg) Countries

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_0900_ai_ci|
|Row Format|Default|
|Min Rows|0|
|Max Rows|0|
|Checksum|False|
|Page Checksum|True|
|Pack Keys|False|
|Delay Key Write|False|
|Is Partitioned|False|
|Encryption|False|
|Persistent Statistics|DEFAULT|
|Auto Recalculate Statistics|DEFAULT|
|Sample Pages|0|
|Created|2021. 04. 10. 15:44:51|
|Last Modified|2021. 04. 10. 15:44:52|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|CountryID|INT||11||False|False|False|True|False||False||
||CountryName|VARCHAR|20|||False|False|False|False|False|NULL|False||
|[![Foreign Keys country_continent_id_fk: Continents](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes country_continent_id_fk](../../../../../Images/index.svg)](#Indexes)|Continent|INT||11||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||country_continent_id_fk|Continent|False|None||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|country_continent_id_fk|ContID|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Countries (
  CountryID INT NOT NULL,
  CountryName VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Continent INT DEFAULT NULL,
  PRIMARY KEY (CountryID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE Countries 
  ADD CONSTRAINT country_continent_id_fk FOREIGN KEY (Continent)
    REFERENCES Continents(ContID);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [Continents](Continents.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [Car_Makers](Car_Makers.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial