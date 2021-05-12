[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>events_statements_histogram_global


# ![logo](../../../../../Images/table64.svg) events_statements_histogram_global

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|BUCKET_NUMBER|INT||11||True|False|False|True|False||False||
||BUCKET_TIMER_LOW|BIGINT||20||True|False|False|True|False||False||
||BUCKET_TIMER_HIGH|BIGINT||20||True|False|False|True|False||False||
||COUNT_BUCKET|BIGINT||20||True|False|False|True|False||False||
||COUNT_BUCKET_AND_LOWER|BIGINT||20||True|False|False|True|False||False||
||BUCKET_QUANTILE|DOUBLE|0|7|6|False|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE events_statements_histogram_global (
  BUCKET_NUMBER INT UNSIGNED NOT NULL,
  BUCKET_TIMER_LOW BIGINT UNSIGNED NOT NULL,
  BUCKET_TIMER_HIGH BIGINT UNSIGNED NOT NULL,
  COUNT_BUCKET BIGINT UNSIGNED NOT NULL,
  COUNT_BUCKET_AND_LOWER BIGINT UNSIGNED NOT NULL,
  BUCKET_QUANTILE DOUBLE(7, 6) NOT NULL,
  PRIMARY KEY (BUCKET_NUMBER)
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