[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>file_instances


# ![logo](../../../../../Images/table64.svg) file_instances

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|FILE_NAME|VARCHAR|512|||False|False|False|True|False||False||
|[![Indexes EVENT_NAME](../../../../../Images/index.svg)](#Indexes)|EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||OPEN_COUNT|INT||11||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||EVENT_NAME|EVENT_NAME|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE file_instances (
  FILE_NAME VARCHAR(512) NOT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  OPEN_COUNT INT UNSIGNED NOT NULL,
  PRIMARY KEY (FILE_NAME)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE file_instances 
  ADD INDEX EVENT_NAME(EVENT_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright ?? All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial