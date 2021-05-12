[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>data_locks


# ![logo](../../../../../Images/table64.svg) data_locks

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ENGINE_TRANSACTION_ID](../../../../../Images/index.svg)](#Indexes)|ENGINE|VARCHAR|32|||False|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|ENGINE_LOCK_ID|VARCHAR|128|||False|False|False|True|False||False||
|[![Indexes ENGINE_TRANSACTION_ID](../../../../../Images/index.svg)](#Indexes)|ENGINE_TRANSACTION_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes THREAD_ID](../../../../../Images/index.svg)](#Indexes)|THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes THREAD_ID](../../../../../Images/index.svg)](#Indexes)|EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes OBJECT_SCHEMA](../../../../../Images/index.svg)](#Indexes)|OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT_SCHEMA](../../../../../Images/index.svg)](#Indexes)|OBJECT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT_SCHEMA](../../../../../Images/index.svg)](#Indexes)|PARTITION_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT_SCHEMA](../../../../../Images/index.svg)](#Indexes)|SUBPARTITION_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||INDEX_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||
||LOCK_TYPE|VARCHAR|32|||False|False|False|True|False||False||
||LOCK_MODE|VARCHAR|32|||False|False|False|True|False||False||
||LOCK_STATUS|VARCHAR|32|||False|False|False|True|False||False||
||LOCK_DATA|VARCHAR|8192|||False|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||ENGINE_TRANSACTION_ID|ENGINE_TRANSACTION_ID, ENGINE|False|None||
||THREAD_ID|THREAD_ID, EVENT_ID|False|None||
||OBJECT_SCHEMA|OBJECT_SCHEMA, OBJECT_NAME, PARTITION_NAME, SUBPARTITION_NAME|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE data_locks (
  ENGINE VARCHAR(32) NOT NULL,
  ENGINE_LOCK_ID VARCHAR(128) NOT NULL,
  ENGINE_TRANSACTION_ID BIGINT UNSIGNED DEFAULT NULL,
  THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  OBJECT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OBJECT_NAME VARCHAR(64) DEFAULT NULL,
  PARTITION_NAME VARCHAR(64) DEFAULT NULL,
  SUBPARTITION_NAME VARCHAR(64) DEFAULT NULL,
  INDEX_NAME VARCHAR(64) DEFAULT NULL,
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL,
  LOCK_TYPE VARCHAR(32) NOT NULL,
  LOCK_MODE VARCHAR(32) NOT NULL,
  LOCK_STATUS VARCHAR(32) NOT NULL,
  LOCK_DATA VARCHAR(8192) DEFAULT NULL,
  PRIMARY KEY (ENGINE_LOCK_ID, ENGINE)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE data_locks 
  ADD INDEX ENGINE_TRANSACTION_ID(ENGINE_TRANSACTION_ID, ENGINE);

ALTER TABLE data_locks 
  ADD INDEX THREAD_ID(THREAD_ID, EVENT_ID);

ALTER TABLE data_locks 
  ADD INDEX OBJECT_SCHEMA(OBJECT_SCHEMA, OBJECT_NAME, PARTITION_NAME, SUBPARTITION_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial