[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>memory_summary_global_by_event_name


# ![logo](../../../../../Images/table64.svg) memory_summary_global_by_event_name

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
||COUNT_ALLOC|BIGINT||20||True|False|False|True|False||False||
||COUNT_FREE|BIGINT||20||True|False|False|True|False||False||
||SUM_NUMBER_OF_BYTES_ALLOC|BIGINT||20||True|False|False|True|False||False||
||SUM_NUMBER_OF_BYTES_FREE|BIGINT||20||True|False|False|True|False||False||
||LOW_COUNT_USED|BIGINT||20||False|False|False|True|False||False||
||CURRENT_COUNT_USED|BIGINT||20||False|False|False|True|False||False||
||HIGH_COUNT_USED|BIGINT||20||False|False|False|True|False||False||
||LOW_NUMBER_OF_BYTES_USED|BIGINT||20||False|False|False|True|False||False||
||CURRENT_NUMBER_OF_BYTES_USED|BIGINT||20||False|False|False|True|False||False||
||HIGH_NUMBER_OF_BYTES_USED|BIGINT||20||False|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE memory_summary_global_by_event_name (
  EVENT_NAME VARCHAR(128) NOT NULL,
  COUNT_ALLOC BIGINT UNSIGNED NOT NULL,
  COUNT_FREE BIGINT UNSIGNED NOT NULL,
  SUM_NUMBER_OF_BYTES_ALLOC BIGINT UNSIGNED NOT NULL,
  SUM_NUMBER_OF_BYTES_FREE BIGINT UNSIGNED NOT NULL,
  LOW_COUNT_USED BIGINT NOT NULL,
  CURRENT_COUNT_USED BIGINT NOT NULL,
  HIGH_COUNT_USED BIGINT NOT NULL,
  LOW_NUMBER_OF_BYTES_USED BIGINT NOT NULL,
  CURRENT_NUMBER_OF_BYTES_USED BIGINT NOT NULL,
  HIGH_NUMBER_OF_BYTES_USED BIGINT NOT NULL,
  PRIMARY KEY (EVENT_NAME)
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
|Author: |Copyright ?? All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial