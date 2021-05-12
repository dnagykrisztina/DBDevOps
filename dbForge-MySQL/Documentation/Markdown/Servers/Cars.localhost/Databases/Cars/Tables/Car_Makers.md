[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[Cars](../Cars.md)>[Tables](Tables.md)>Car_Makers


# ![logo](../../../../../Images/table64.svg) Car_Makers

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
|Created|2021. 04. 10. 15:37:35|
|Last Modified|2021. 04. 10. 15:37:36|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|ID|INT||11||False|False|False|True|False||False||
||Maker|VARCHAR|15|||False|False|False|False|False|NULL|False||
||FullName|VARCHAR|25|||False|False|False|False|False|NULL|False||
|[![Foreign Keys car_maker_country_id_fk: Countries](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes car_maker_country_id_fk](../../../../../Images/index.svg)](#Indexes)|Country|INT||11||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||car_maker_country_id_fk|Country|False|None||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|car_maker_country_id_fk|CountryID|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Car_Makers (
  ID INT NOT NULL,
  Maker VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  FullName VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Country INT DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE Car_Makers 
  ADD CONSTRAINT car_maker_country_id_fk FOREIGN KEY (Country)
    REFERENCES Countries(CountryID);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [Countries](Countries.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [Model_Details](Model_Details.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial