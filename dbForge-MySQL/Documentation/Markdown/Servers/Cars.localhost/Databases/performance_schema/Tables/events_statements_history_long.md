[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_statements_history_long


# ![logo](../../../../../Images/table64.svg) events_statements_history_long

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
||THREAD_ID|BIGINT||20||True|False|False|True|False||False||
||EVENT_ID|BIGINT||20||True|False|False|True|False||False||
||END_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||SOURCE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||TIMER_START|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_END|BIGINT||20||True|False|False|False|False|NULL|False||
||TIMER_WAIT|BIGINT||20||True|False|False|False|False|NULL|False||
||LOCK_TIME|BIGINT||20||True|False|False|True|False||False||
||SQL_TEXT|LONGTEXT||||False|False|False|False|False||False||
||DIGEST|VARCHAR|64|||False|False|False|False|False|NULL|False||
||DIGEST_TEXT|LONGTEXT||||False|False|False|False|False||False||
||CURRENT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
||OBJECT_TYPE|VARCHAR|64|||False|False|False|False|False|NULL|False||
||OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
||OBJECT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|False|False|NULL|False||
||MYSQL_ERRNO|INT||11||False|False|False|False|False|NULL|False||
||RETURNED_SQLSTATE|VARCHAR|5|||False|False|False|False|False|NULL|False||
||MESSAGE_TEXT|VARCHAR|128|||False|False|False|False|False|NULL|False||
||ERRORS|BIGINT||20||True|False|False|True|False||False||
||WARNINGS|BIGINT||20||True|False|False|True|False||False||
||ROWS_AFFECTED|BIGINT||20||True|False|False|True|False||False||
||ROWS_SENT|BIGINT||20||True|False|False|True|False||False||
||ROWS_EXAMINED|BIGINT||20||True|False|False|True|False||False||
||CREATED_TMP_DISK_TABLES|BIGINT||20||True|False|False|True|False||False||
||CREATED_TMP_TABLES|BIGINT||20||True|False|False|True|False||False||
||SELECT_FULL_JOIN|BIGINT||20||True|False|False|True|False||False||
||SELECT_FULL_RANGE_JOIN|BIGINT||20||True|False|False|True|False||False||
||SELECT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SELECT_RANGE_CHECK|BIGINT||20||True|False|False|True|False||False||
||SELECT_SCAN|BIGINT||20||True|False|False|True|False||False||
||SORT_MERGE_PASSES|BIGINT||20||True|False|False|True|False||False||
||SORT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SORT_ROWS|BIGINT||20||True|False|False|True|False||False||
||SORT_SCAN|BIGINT||20||True|False|False|True|False||False||
||NO_INDEX_USED|BIGINT||20||True|False|False|True|False||False||
||NO_GOOD_INDEX_USED|BIGINT||20||True|False|False|True|False||False||
||NESTING_EVENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||NESTING_EVENT_TYPE|ENUM|0|||False|False|False|False|False|NULL|False||
||NESTING_EVENT_LEVEL|INT||11||False|False|False|False|False|NULL|False||
||STATEMENT_ID|BIGINT||20||True|False|False|False|False|NULL|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_statements_history_long (
  THREAD_ID BIGINT UNSIGNED NOT NULL,
  EVENT_ID BIGINT UNSIGNED NOT NULL,
  END_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  SOURCE VARCHAR(64) DEFAULT NULL,
  TIMER_START BIGINT UNSIGNED DEFAULT NULL,
  TIMER_END BIGINT UNSIGNED DEFAULT NULL,
  TIMER_WAIT BIGINT UNSIGNED DEFAULT NULL,
  LOCK_TIME BIGINT UNSIGNED NOT NULL,
  SQL_TEXT LONGTEXT DEFAULT NULL,
  DIGEST VARCHAR(64) DEFAULT NULL,
  DIGEST_TEXT LONGTEXT DEFAULT NULL,
  CURRENT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OBJECT_TYPE VARCHAR(64) DEFAULT NULL,
  OBJECT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OBJECT_NAME VARCHAR(64) DEFAULT NULL,
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED DEFAULT NULL,
  MYSQL_ERRNO INT DEFAULT NULL,
  RETURNED_SQLSTATE VARCHAR(5) DEFAULT NULL,
  MESSAGE_TEXT VARCHAR(128) DEFAULT NULL,
  ERRORS BIGINT UNSIGNED NOT NULL,
  WARNINGS BIGINT UNSIGNED NOT NULL,
  ROWS_AFFECTED BIGINT UNSIGNED NOT NULL,
  ROWS_SENT BIGINT UNSIGNED NOT NULL,
  ROWS_EXAMINED BIGINT UNSIGNED NOT NULL,
  CREATED_TMP_DISK_TABLES BIGINT UNSIGNED NOT NULL,
  CREATED_TMP_TABLES BIGINT UNSIGNED NOT NULL,
  SELECT_FULL_JOIN BIGINT UNSIGNED NOT NULL,
  SELECT_FULL_RANGE_JOIN BIGINT UNSIGNED NOT NULL,
  SELECT_RANGE BIGINT UNSIGNED NOT NULL,
  SELECT_RANGE_CHECK BIGINT UNSIGNED NOT NULL,
  SELECT_SCAN BIGINT UNSIGNED NOT NULL,
  SORT_MERGE_PASSES BIGINT UNSIGNED NOT NULL,
  SORT_RANGE BIGINT UNSIGNED NOT NULL,
  SORT_ROWS BIGINT UNSIGNED NOT NULL,
  SORT_SCAN BIGINT UNSIGNED NOT NULL,
  NO_INDEX_USED BIGINT UNSIGNED NOT NULL,
  NO_GOOD_INDEX_USED BIGINT UNSIGNED NOT NULL,
  NESTING_EVENT_ID BIGINT UNSIGNED DEFAULT NULL,
  NESTING_EVENT_TYPE ENUM('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL,
  NESTING_EVENT_LEVEL INT DEFAULT NULL,
  STATEMENT_ID BIGINT UNSIGNED DEFAULT NULL
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