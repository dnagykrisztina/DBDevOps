[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>table_io_waits_summary_by_index_usage


# ![logo](../../../../../Images/table64.svg) table_io_waits_summary_by_index_usage

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
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_TYPE|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|OBJECT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OBJECT](../../../../../Images/index.svg)](#Indexes)|INDEX_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||COUNT_STAR|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||COUNT_READ|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_READ|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_READ|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_READ|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_READ|BIGINT||20||True|False|False|True|False||False||
||COUNT_WRITE|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_WRITE|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_WRITE|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_WRITE|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_WRITE|BIGINT||20||True|False|False|True|False||False||
||COUNT_FETCH|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_FETCH|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_FETCH|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_FETCH|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_FETCH|BIGINT||20||True|False|False|True|False||False||
||COUNT_INSERT|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_INSERT|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_INSERT|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_INSERT|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_INSERT|BIGINT||20||True|False|False|True|False||False||
||COUNT_UPDATE|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_UPDATE|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_UPDATE|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_UPDATE|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_UPDATE|BIGINT||20||True|False|False|True|False||False||
||COUNT_DELETE|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_DELETE|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_DELETE|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_DELETE|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_DELETE|BIGINT||20||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||OBJECT|OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME, INDEX_NAME|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE table_io_waits_summary_by_index_usage (
  OBJECT_TYPE VARCHAR(64) DEFAULT NULL,
  OBJECT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OBJECT_NAME VARCHAR(64) DEFAULT NULL,
  INDEX_NAME VARCHAR(64) DEFAULT NULL,
  COUNT_STAR BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  COUNT_READ BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_READ BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_READ BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_READ BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_READ BIGINT UNSIGNED NOT NULL,
  COUNT_WRITE BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_WRITE BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_WRITE BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_WRITE BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_WRITE BIGINT UNSIGNED NOT NULL,
  COUNT_FETCH BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_FETCH BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_FETCH BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_FETCH BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_FETCH BIGINT UNSIGNED NOT NULL,
  COUNT_INSERT BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_INSERT BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_INSERT BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_INSERT BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_INSERT BIGINT UNSIGNED NOT NULL,
  COUNT_UPDATE BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_UPDATE BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_UPDATE BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_UPDATE BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_UPDATE BIGINT UNSIGNED NOT NULL,
  COUNT_DELETE BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_DELETE BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_DELETE BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_DELETE BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_DELETE BIGINT UNSIGNED NOT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE table_io_waits_summary_by_index_usage 
  ADD UNIQUE INDEX OBJECT(OBJECT_TYPE, OBJECT_SCHEMA, OBJECT_NAME, INDEX_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial