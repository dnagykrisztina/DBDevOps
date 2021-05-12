[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[Compare](../Compare.md)>[Tables](Tables.md)>Car_Names


# ![logo](../../../../../Images/table64.svg) Car_Names

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
|Last Modified|2021. 04. 10. 15:45:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|ID|INT||11||False|False|False|True|False||False||
|[![Foreign Keys Car_Names_model_fk: Model_Details](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes Car_Names_model_fk](../../../../../Images/index.svg)](#Indexes)|Model|VARCHAR|25|||False|False|False|False|False|NULL|False||
||Descr|VARCHAR|40|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||Car_Names_model_fk|Model|False|None||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|Car_Names_model_fk|Model|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Car_Names (
  ID INT NOT NULL,
  Model VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Descr VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE Car_Names 
  ADD CONSTRAINT Car_Names_model_fk FOREIGN KEY (Model)
    REFERENCES Model_Details(Model);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [Model_Details](Model_Details.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [Car_Details](Car_Details.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial