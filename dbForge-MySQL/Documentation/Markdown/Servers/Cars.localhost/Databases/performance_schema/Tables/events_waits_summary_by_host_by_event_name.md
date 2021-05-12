[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_waits_summary_by_host_by_event_name


# ![logo](../../../../../Images/table64.svg) events_waits_summary_by_host_by_event_name

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
|[![Indexes HOST](../../../../../Images/index.svg)](#Indexes)|HOST|CHAR|255|||False|False|False|False|False|NULL|False||
|[![Indexes HOST](../../../../../Images/index.svg)](#Indexes)|EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||COUNT_STAR|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_WAIT|BIGINT||20||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||HOST|HOST, EVENT_NAME|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_waits_summary_by_host_by_event_name (
  HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  EVENT_NAME VARCHAR(128) NOT NULL,
  COUNT_STAR BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_WAIT BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_WAIT BIGINT UNSIGNED NOT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE events_waits_summary_by_host_by_event_name 
  ADD UNIQUE INDEX HOST(HOST, EVENT_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial