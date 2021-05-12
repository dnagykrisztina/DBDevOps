[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>status_by_user


# ![logo](../../../../../Images/table64.svg) status_by_user

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|PERFORMANCE_SCHEMA|
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
|Created|2021. 04. 10. 15:36:55|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Indexes USER](../../../../../Images/index.svg)](#Indexes)|USER|CHAR|32|||False|False|True|False|False|NULL|False||
|[![Indexes USER](../../../../../Images/index.svg)](#Indexes)|VARIABLE_NAME|VARCHAR|64|||False|False|False|True|False||False||
||VARIABLE_VALUE|VARCHAR|1024|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||USER|USER, VARIABLE_NAME|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE status_by_user (
  USER CHAR(32) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  VARIABLE_NAME VARCHAR(64) NOT NULL,
  VARIABLE_VALUE VARCHAR(1024) DEFAULT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE status_by_user 
  ADD UNIQUE INDEX USER(USER, VARIABLE_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial