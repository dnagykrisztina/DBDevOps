[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_stages_current


# ![logo](../../../../../Images/table64.svg) events_stages_current

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
||SOURCE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||TIMER_START|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_END|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_WAIT|BIGINT||20||True|False|False|False|False|NULL|False||
||WORK_COMPLETED|BIGINT||20||True|False|False|False|False|NULL|False||
||WORK_ESTIMATED|BIGINT||20||True|False|False|False|False|NULL|False||
||NESTING_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||NESTING_EVENT_TYPE|ENUM|0|||False|False|False|False|False|NULL|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_stages_current (
  THREAD_ID BIGINT UNSIGNED NOT NULL,
  EVENT_ID BIGINT UNSIGNED NOT NULL,
  END_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  SOURCE VARCHAR(64) DEFAULT NULL,
  TIMER_START BIGINT UNSIGNED DEFAULT NULL,
  TIMER_END BIGINT UNSIGNED DEFAULT NULL,
  TIMER_WAIT BIGINT UNSIGNED DEFAULT NULL,
  WORK_COMPLETED BIGINT UNSIGNED DEFAULT NULL,
  WORK_ESTIMATED BIGINT UNSIGNED DEFAULT NULL,
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