[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_errors_summary_global_by_error


# ![logo](../../../../../Images/table64.svg) events_errors_summary_global_by_error

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
|[![Indexes ERROR_NUMBER](../../../../../Images/index.svg)](#Indexes)|ERROR_NUMBER|INT||11||False|False|False|False|False|NULL|False||
||ERROR_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||SQL_STATE|VARCHAR|5|||False|False|False|False|False|NULL|False||
||SUM_ERROR_RAISED|BIGINT||20||True|False|False|True|False||False||
||SUM_ERROR_HANDLED|BIGINT||20||True|False|False|True|False||False||
||FIRST_SEEN|TIMESTAMP|0|||False|False|False|False|False|'0000-00-00 00:00:00'|False||
||LAST_SEEN|TIMESTAMP|0|||False|False|False|False|False|'0000-00-00 00:00:00'|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||ERROR_NUMBER|ERROR_NUMBER|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_errors_summary_global_by_error (
  ERROR_NUMBER INT DEFAULT NULL,
  ERROR_NAME VARCHAR(64) DEFAULT NULL,
  SQL_STATE VARCHAR(5) DEFAULT NULL,
  SUM_ERROR_RAISED BIGINT UNSIGNED NOT NULL,
  SUM_ERROR_HANDLED BIGINT UNSIGNED NOT NULL,
  FIRST_SEEN TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  LAST_SEEN TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00'
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE events_errors_summary_global_by_error 
  ADD UNIQUE INDEX ERROR_NUMBER(ERROR_NUMBER);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial