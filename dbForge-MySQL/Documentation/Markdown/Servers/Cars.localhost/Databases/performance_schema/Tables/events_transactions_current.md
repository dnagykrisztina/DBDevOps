[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_transactions_current


# ![logo](../../../../../Images/table64.svg) events_transactions_current

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|EVENT_ID|BIGINT||20||True|False|False|True|False||False||
||END_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||STATE|ENUM|0|||False|False|False|False|False|NULL|False||
||TRX_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||GTID|VARCHAR|64|||False|False|False|False|False|NULL|False||
||XID_FORMAT_ID|INT||11||False|False|False|False|False|NULL|False||
||XID_GTRID|VARCHAR|130|||False|False|False|False|False|NULL|False||
||XID_BQUAL|VARCHAR|130|||False|False|False|False|False|NULL|False||
||XA_STATE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||SOURCE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||TIMER_START|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_END|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_WAIT|BIGINT||20||True|False|False|False|False|NULL|False||
||ACCESS_MODE|ENUM|0|||False|False|False|False|False|NULL|False||
||ISOLATION_LEVEL|VARCHAR|64|||False|False|False|False|False|NULL|False||
||AUTOCOMMIT|ENUM|0|||False|False|False|True|False||False||
||NUMBER_OF_SAVEPOINTS|BIGINT||20||True|False|False|False|False|NULL|False||
||NUMBER_OF_ROLLBACK_TO_SAVEPOINT|BIGINT||20||True|False|False|False|False|NULL|False||
||NUMBER_OF_RELEASE_SAVEPOINT|BIGINT||20||True|False|False|False|False|NULL|False||
||OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|False|False|NULL|False||
||NESTING_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||NESTING_EVENT_TYPE|ENUM|0|||False|False|False|False|False|NULL|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_transactions_current (
  THREAD_ID BIGINT UNSIGNED NOT NULL,
  EVENT_ID BIGINT UNSIGNED NOT NULL,
  END_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  STATE ENUM('ACTIVE','COMMITTED','ROLLED BACK') DEFAULT NULL,
  TRX_ID BIGINT UNSIGNED DEFAULT NULL,
  GTID VARCHAR(64) DEFAULT NULL,
  XID_FORMAT_ID INT DEFAULT NULL,
  XID_GTRID VARCHAR(130) DEFAULT NULL,
  XID_BQUAL VARCHAR(130) DEFAULT NULL,
  XA_STATE VARCHAR(64) DEFAULT NULL,
  SOURCE VARCHAR(64) DEFAULT NULL,
  TIMER_START BIGINT UNSIGNED DEFAULT NULL,
  TIMER_END BIGINT UNSIGNED DEFAULT NULL,
  TIMER_WAIT BIGINT UNSIGNED DEFAULT NULL,
  ACCESS_MODE ENUM('READ ONLY','READ WRITE') DEFAULT NULL,
  ISOLATION_LEVEL VARCHAR(64) DEFAULT NULL,
  AUTOCOMMIT ENUM('YES','NO') NOT NULL,
  NUMBER_OF_SAVEPOINTS BIGINT UNSIGNED DEFAULT NULL,
  NUMBER_OF_ROLLBACK_TO_SAVEPOINT BIGINT UNSIGNED DEFAULT NULL,
  NUMBER_OF_RELEASE_SAVEPOINT BIGINT UNSIGNED DEFAULT NULL,
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED DEFAULT NULL,
  NESTING_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  NESTING_EVENT_TYPE ENUM('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL,
  PRIMARY KEY (THREAD_ID, EVENT_ID)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial