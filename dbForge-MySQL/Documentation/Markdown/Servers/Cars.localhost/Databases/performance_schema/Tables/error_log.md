[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>error_log


# ![logo](../../../../../Images/table64.svg) error_log

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|LOGGED|TIMESTAMP|0|6||False|False|False|True|False||False||
|[![Indexes THREAD_ID](../../../../../Images/index.svg)](#Indexes)|THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes PRIO](../../../../../Images/index.svg)](#Indexes)|PRIO|ENUM|0|||False|False|False|True|False||False||
|[![Indexes ERROR_CODE](../../../../../Images/index.svg)](#Indexes)|ERROR_CODE|VARCHAR|10|||False|False|False|False|False|NULL|False||
|[![Indexes SUBSYSTEM](../../../../../Images/index.svg)](#Indexes)|SUBSYSTEM|VARCHAR|7|||False|False|False|False|False|NULL|False||
||DATA|TEXT||||False|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||THREAD_ID|THREAD_ID|False|None||
||PRIO|PRIO|False|None||
||ERROR_CODE|ERROR_CODE|False|None||
||SUBSYSTEM|SUBSYSTEM|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE error_log (
  LOGGED TIMESTAMP(6) NOT NULL,
  THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  PRIO ENUM('System','Error','Warning','Note') NOT NULL,
  ERROR_CODE VARCHAR(10) DEFAULT NULL,
  SUBSYSTEM VARCHAR(7) DEFAULT NULL,
  DATA TEXT NOT NULL,
  PRIMARY KEY (LOGGED)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE error_log 
  ADD INDEX THREAD_ID(THREAD_ID);

ALTER TABLE error_log 
  ADD INDEX PRIO(PRIO);

ALTER TABLE error_log 
  ADD INDEX ERROR_CODE(ERROR_CODE);

ALTER TABLE error_log 
  ADD INDEX SUBSYSTEM(SUBSYSTEM);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial