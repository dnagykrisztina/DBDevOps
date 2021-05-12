[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[Cars](../Cars.md)>[Tables](Tables.md)>Car_Details


# ![logo](../../../../../Images/table64.svg) Car_Details

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
|Created|2021. 04. 10. 15:46:45|
|Last Modified|2021. 04. 10. 15:37:51|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys Car_Details_id_fk: Car_Names](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes `ID`](../../../../../Images/index.svg)](#Indexes)|ID|INT||11||False|False|False|True|False||False||
||mpg|FLOAT|0|5|2|False|False|False|False|False|NULL|False||
||cylinders|INT||11||False|False|False|False|False|NULL|False||
||edispl|INT||11||False|False|False|False|False|NULL|False||
||horsepower|INT||11||False|False|False|False|False|NULL|False||
||weight|INT||11||False|False|False|False|False|NULL|False||
||accel|FLOAT|0|10|2|False|False|False|False|False|NULL|False||
||year|INT||11||False|False|False|False|False|NULL|False||
||horsePower2|INT||11||False|False|False|False|False|NULL|False||
||color|VARCHAR|25|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||`ID`|ID|False|None||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|Car_Details_id_fk|ID|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Car_Details (
  ID INT NOT NULL,
  mpg FLOAT(5, 2) DEFAULT NULL,
  cylinders INT DEFAULT NULL,
  edispl INT DEFAULT NULL,
  horsepower INT DEFAULT NULL,
  weight INT DEFAULT NULL,
  accel FLOAT(10, 2) DEFAULT NULL,
  year INT DEFAULT NULL,
  horsePower2 INT DEFAULT NULL,
  color VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE Car_Details 
  ADD CONSTRAINT Car_Details_id_fk FOREIGN KEY (ID)
    REFERENCES Car_Names(ID);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [Car_Names](Car_Names.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial