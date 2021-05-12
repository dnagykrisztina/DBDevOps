[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>data_lock_waits


# ![logo](../../../../../Images/table64.svg) data_lock_waits

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
|[![Indexes REQUESTING_ENGINE_LOCK_IDBLOCKING_ENGINE_LOCK_IDREQUESTING_ENGINE_TRANSACTION_IDBLOCKING_ENGINE_TRANSACTION_ID](../../../../../Images/index.svg)](#Indexes)|ENGINE|VARCHAR|32|||False|False|False|True|False||False||
|[![Indexes REQUESTING_ENGINE_LOCK_ID](../../../../../Images/index.svg)](#Indexes)|REQUESTING_ENGINE_LOCK_ID|VARCHAR|128|||False|False|False|True|False||False||
|[![Indexes REQUESTING_ENGINE_TRANSACTION_ID](../../../../../Images/index.svg)](#Indexes)|REQUESTING_ENGINE_TRANSACTION_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes REQUESTING_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|REQUESTING_THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes REQUESTING_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|REQUESTING_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||REQUESTING_OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||
|[![Indexes BLOCKING_ENGINE_LOCK_ID](../../../../../Images/index.svg)](#Indexes)|BLOCKING_ENGINE_LOCK_ID|VARCHAR|128|||False|False|False|True|False||False||
|[![Indexes BLOCKING_ENGINE_TRANSACTION_ID](../../../../../Images/index.svg)](#Indexes)|BLOCKING_ENGINE_TRANSACTION_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes BLOCKING_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|BLOCKING_THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes BLOCKING_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|BLOCKING_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||BLOCKING_OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||REQUESTING_ENGINE_LOCK_ID|REQUESTING_ENGINE_LOCK_ID, ENGINE|False|None||
||BLOCKING_ENGINE_LOCK_ID|BLOCKING_ENGINE_LOCK_ID, ENGINE|False|None||
||REQUESTING_ENGINE_TRANSACTION_ID|REQUESTING_ENGINE_TRANSACTION_ID, ENGINE|False|None||
||BLOCKING_ENGINE_TRANSACTION_ID|BLOCKING_ENGINE_TRANSACTION_ID, ENGINE|False|None||
||REQUESTING_THREAD_ID|REQUESTING_THREAD_ID, REQUESTING_EVENT_ID|False|None||
||BLOCKING_THREAD_ID|BLOCKING_THREAD_ID, BLOCKING_EVENT_ID|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE data_lock_waits (
  ENGINE VARCHAR(32) NOT NULL,
  REQUESTING_ENGINE_LOCK_ID VARCHAR(128) NOT NULL,
  REQUESTING_ENGINE_TRANSACTION_ID BIGINT UNSIGNED DEFAULT NULL,
  REQUESTING_THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  REQUESTING_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  REQUESTING_OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL,
  BLOCKING_ENGINE_LOCK_ID VARCHAR(128) NOT NULL,
  BLOCKING_ENGINE_TRANSACTION_ID BIGINT UNSIGNED DEFAULT NULL,
  BLOCKING_THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  BLOCKING_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  BLOCKING_OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE data_lock_waits 
  ADD INDEX REQUESTING_ENGINE_LOCK_ID(REQUESTING_ENGINE_LOCK_ID, ENGINE);

ALTER TABLE data_lock_waits 
  ADD INDEX BLOCKING_ENGINE_LOCK_ID(BLOCKING_ENGINE_LOCK_ID, ENGINE);

ALTER TABLE data_lock_waits 
  ADD INDEX REQUESTING_ENGINE_TRANSACTION_ID(REQUESTING_ENGINE_TRANSACTION_ID, ENGINE);

ALTER TABLE data_lock_waits 
  ADD INDEX BLOCKING_ENGINE_TRANSACTION_ID(BLOCKING_ENGINE_TRANSACTION_ID, ENGINE);

ALTER TABLE data_lock_waits 
  ADD INDEX REQUESTING_THREAD_ID(REQUESTING_THREAD_ID, REQUESTING_EVENT_ID);

ALTER TABLE data_lock_waits 
  ADD INDEX BLOCKING_THREAD_ID(BLOCKING_THREAD_ID, BLOCKING_EVENT_ID);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial