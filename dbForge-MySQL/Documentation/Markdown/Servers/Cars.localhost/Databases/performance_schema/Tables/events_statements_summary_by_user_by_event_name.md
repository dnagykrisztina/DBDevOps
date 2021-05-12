[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_statements_summary_by_user_by_event_name


# ![logo](../../../../../Images/table64.svg) events_statements_summary_by_user_by_event_name

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
|[![Indexes USER](../../../../../Images/index.svg)](#Indexes)|USER|CHAR|32|||False|False|True|False|False|NULL|False||
|[![Indexes USER](../../../../../Images/index.svg)](#Indexes)|EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||COUNT_STAR|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||SUM_LOCK_TIME|BIGINT||20||True|False|False|True|False||False||
||SUM_ERRORS|BIGINT||20||True|False|False|True|False||False||
||SUM_WARNINGS|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_AFFECTED|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_SENT|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_EXAMINED|BIGINT||20||True|False|False|True|False||False||
||SUM_CREATED_TMP_DISK_TABLES|BIGINT||20||True|False|False|True|False||False||
||SUM_CREATED_TMP_TABLES|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_FULL_JOIN|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_FULL_RANGE_JOIN|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_RANGE_CHECK|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_SCAN|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_MERGE_PASSES|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_ROWS|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_SCAN|BIGINT||20||True|False|False|True|False||False||
||SUM_NO_INDEX_USED|BIGINT||20||True|False|False|True|False||False||
||SUM_NO_GOOD_INDEX_USED|BIGINT||20||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||USER|USER, EVENT_NAME|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_statements_summary_by_user_by_event_name (
  USER CHAR(32) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  COUNT_STAR BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  SUM_LOCK_TIME BIGINT UNSIGNED NOT NULL,
  SUM_ERRORS BIGINT UNSIGNED NOT NULL,
  SUM_WARNINGS BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_AFFECTED BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_SENT BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_EXAMINED BIGINT UNSIGNED NOT NULL,
  SUM_CREATED_TMP_DISK_TABLES BIGINT UNSIGNED NOT NULL,
  SUM_CREATED_TMP_TABLES BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_FULL_JOIN BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_FULL_RANGE_JOIN BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_RANGE BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_RANGE_CHECK BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_SCAN BIGINT UNSIGNED NOT NULL,
  SUM_SORT_MERGE_PASSES BIGINT UNSIGNED NOT NULL,
  SUM_SORT_RANGE BIGINT UNSIGNED NOT NULL,
  SUM_SORT_ROWS BIGINT UNSIGNED NOT NULL,
  SUM_SORT_SCAN BIGINT UNSIGNED NOT NULL,
  SUM_NO_INDEX_USED BIGINT UNSIGNED NOT NULL,
  SUM_NO_GOOD_INDEX_USED BIGINT UNSIGNED NOT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE events_statements_summary_by_user_by_event_name 
  ADD UNIQUE INDEX USER(USER, EVENT_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial