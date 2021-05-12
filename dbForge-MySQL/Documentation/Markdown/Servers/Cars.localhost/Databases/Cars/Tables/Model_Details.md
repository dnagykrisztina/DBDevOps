[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[Cars](../Cars.md)>[Tables](Tables.md)>Model_Details


# ![logo](../../../../../Images/table64.svg) Model_Details

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
|Last Modified|2021. 04. 10. 15:37:37|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|ModelID|INT||11||False|False|False|True|False||False||
|[![Foreign Keys model_maker_fk: Car_Makers](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes model_maker_fk](../../../../../Images/index.svg)](#Indexes)|Maker|INT||11||False|False|False|False|False|NULL|False||
|[![Indexes model_unique](../../../../../Images/index.svg)](#Indexes)|Model|VARCHAR|25|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||model_unique|Model|True|None||
||model_maker_fk|Maker|False|None||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|model_maker_fk|ID|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Model_Details (
  ModelID INT NOT NULL,
  Maker INT DEFAULT NULL,
  Model VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (ModelID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE Model_Details 
  ADD UNIQUE INDEX model_unique(Model);

ALTER TABLE Model_Details 
  ADD CONSTRAINT model_maker_fk FOREIGN KEY (Maker)
    REFERENCES Car_Makers(ID);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [Car_Makers](Car_Makers.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [Car_Names](Car_Names.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial