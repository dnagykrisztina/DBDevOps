[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>setup_objects


# ![logo](../../../../../Images/table64.svg) setup_objects

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
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_TYPE|ENUM|0|||False|False|False|True|False|'TABLE'|False||
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|'%'|False||
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_NAME|VARCHAR|64|||False|False|False|True|False|'%'|False||
||ENABLED|ENUM|0|||False|False|False|True|False|'YES'|False||
||TIMED|ENUM|0|||False|False|False|True|False|'YES'|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||OBJECT|OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE setup_objects (
  OBJECT_TYPE ENUM('EVENT','FUNCTION','PROCEDURE','TABLE','TRIGGER') NOT NULL DEFAULT 'TABLE',
  OBJECT_SCHEMA VARCHAR(64) DEFAULT '%',
  OBJECT_NAME VARCHAR(64) NOT NULL DEFAULT '%',
  ENABLED ENUM('YES','NO') NOT NULL DEFAULT 'YES',
  TIMED ENUM('YES','NO') NOT NULL DEFAULT 'YES'
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE setup_objects 
  ADD UNIQUE INDEX OBJECT(OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial