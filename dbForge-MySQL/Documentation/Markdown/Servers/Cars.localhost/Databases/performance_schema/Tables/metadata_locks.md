[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>metadata_locks


# ![logo](../../../../../Images/table64.svg) metadata_locks

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
|[![Indexes OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OBJECT_TYPE|VARCHAR|64|||False|False|False|True|False||False||
|[![Indexes OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OBJECT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|COLUMN_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||
||LOCK_TYPE|VARCHAR|32|||False|False|False|True|False||False||
||LOCK_DURATION|VARCHAR|32|||False|False|False|True|False||False||
||LOCK_STATUS|VARCHAR|32|||False|False|False|True|False||False||
||SOURCE|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OWNER_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|OWNER_THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes OWNER_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|OWNER_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||OBJECT_TYPE|OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME, COLUMN_NAME|False|None||
||OWNER_THREAD_ID|OWNER_THREAD_ID, OWNER_EVENT_ID|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE metadata_locks (
  OBJECT_TYPE VARCHAR(64) NOT NULL,
  OBJECT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OBJECT_NAME VARCHAR(64) DEFAULT NULL,
  COLUMN_NAME VARCHAR(64) DEFAULT NULL,
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL,
  LOCK_TYPE VARCHAR(32) NOT NULL,
  LOCK_DURATION VARCHAR(32) NOT NULL,
  LOCK_STATUS VARCHAR(32) NOT NULL,
  SOURCE VARCHAR(64) DEFAULT NULL,
  OWNER_THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  OWNER_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (OBJECT_INSTANCE_BEGIN)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE metadata_locks 
  ADD INDEX OBJECT_TYPE(OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME, COLUMN_NAME);

ALTER TABLE metadata_locks 
  ADD INDEX OWNER_THREAD_ID(OWNER_THREAD_ID, OWNER_EVENT_ID);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial