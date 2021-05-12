[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>threads


# ![logo](../../../../../Images/table64.svg) threads

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|THREAD_ID|BIGINT||20||True|False|False|True|False||False||
|[![Indexes NAME](../../../../../Images/index.svg)](#Indexes)|NAME|VARCHAR|128|||False|False|False|True|False||False||
||TYPE|VARCHAR|10|||False|False|False|True|False||False||
|[![Indexes PROCESSLIST_ID](../../../../../Images/index.svg)](#Indexes)|PROCESSLIST_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes PROCESSLIST_ACCOUNT](../../../../../Images/index.svg)](#Indexes)|PROCESSLIST_USER|VARCHAR|32|||False|False|False|False|False|NULL|False||
|[![Indexes PROCESSLIST_ACCOUNTPROCESSLIST_HOST](../../../../../Images/index.svg)](#Indexes)|PROCESSLIST_HOST|VARCHAR|255|||False|False|False|False|False|NULL|False||
||PROCESSLIST_DB|VARCHAR|64|||False|False|False|False|False|NULL|False||
||PROCESSLIST_COMMAND|VARCHAR|16|||False|False|False|False|False|NULL|False||
||PROCESSLIST_TIME|BIGINT||20||False|False|False|False|False|NULL|False||
||PROCESSLIST_STATE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||PROCESSLIST_INFO|LONGTEXT||||False|False|False|False|False||False||
||PARENT_THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||ROLE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||INSTRUMENTED|ENUM|0|||False|False|False|True|False||False||
||HISTORY|ENUM|0|||False|False|False|True|False||False||
||CONNECTION_TYPE|VARCHAR|16|||False|False|False|False|False|NULL|False||
|[![Indexes THREAD_OS_ID](../../../../../Images/index.svg)](#Indexes)|THREAD_OS_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes RESOURCE_GROUP](../../../../../Images/index.svg)](#Indexes)|RESOURCE_GROUP|VARCHAR|64|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||PROCESSLIST_ID|PROCESSLIST_ID|False|None||
||THREAD_OS_ID|THREAD_OS_ID|False|None||
||NAME|NAME|False|None||
||PROCESSLIST_ACCOUNT|PROCESSLIST_USER, PROCESSLIST_HOST|False|None||
||PROCESSLIST_HOST|PROCESSLIST_HOST|False|None||
||RESOURCE_GROUP|RESOURCE_GROUP|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE threads (
  THREAD_ID BIGINT UNSIGNED NOT NULL,
  NAME VARCHAR(128) NOT NULL,
  TYPE VARCHAR(10) NOT NULL,
  PROCESSLIST_ID BIGINT UNSIGNED DEFAULT NULL,
  PROCESSLIST_USER VARCHAR(32) DEFAULT NULL,
  PROCESSLIST_HOST VARCHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PROCESSLIST_DB VARCHAR(64) DEFAULT NULL,
  PROCESSLIST_COMMAND VARCHAR(16) DEFAULT NULL,
  PROCESSLIST_TIME BIGINT DEFAULT NULL,
  PROCESSLIST_STATE VARCHAR(64) DEFAULT NULL,
  PROCESSLIST_INFO LONGTEXT DEFAULT NULL,
  PARENT_THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  ROLE VARCHAR(64) DEFAULT NULL,
  INSTRUMENTED ENUM('YES','NO') NOT NULL,
  HISTORY ENUM('YES','NO') NOT NULL,
  CONNECTION_TYPE VARCHAR(16) DEFAULT NULL,
  THREAD_OS_ID BIGINT UNSIGNED DEFAULT NULL,
  RESOURCE_GROUP VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (THREAD_ID)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE threads 
  ADD INDEX PROCESSLIST_ID(PROCESSLIST_ID);

ALTER TABLE threads 
  ADD INDEX THREAD_OS_ID(THREAD_OS_ID);

ALTER TABLE threads 
  ADD INDEX NAME(NAME);

ALTER TABLE threads 
  ADD INDEX PROCESSLIST_ACCOUNT(PROCESSLIST_USER, PROCESSLIST_HOST);

ALTER TABLE threads 
  ADD INDEX PROCESSLIST_HOST(PROCESSLIST_HOST);

ALTER TABLE threads 
  ADD INDEX RESOURCE_GROUP(RESOURCE_GROUP);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial