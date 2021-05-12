[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_applier_filters


# ![logo](../../../../../Images/table64.svg) replication_applier_filters

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
||CHANNEL_NAME|CHAR|64|||False|False|False|True|False||False||
||FILTER_NAME|CHAR|64|||False|False|False|True|False||False||
||FILTER_RULE|LONGTEXT||||False|False|False|True|False||False||
||CONFIGURED_BY|ENUM|0|||False|False|False|True|False||False||
||ACTIVE_SINCE|TIMESTAMP|0|6||False|False|False|True|False|'0000-00-00 00:00:00.000000'|False||
||COUNTER|BIGINT||20||True|False|False|True|False|'0'|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_applier_filters (
  CHANNEL_NAME CHAR(64) NOT NULL,
  FILTER_NAME CHAR(64) NOT NULL,
  FILTER_RULE LONGTEXT NOT NULL,
  CONFIGURED_BY ENUM('STARTUP_OPTIONS','CHANGE_REPLICATION_FILTER','STARTUP_OPTIONS_FOR_CHANNEL','CHANGE_REPLICATION_FILTER_FOR_CHANNEL') NOT NULL,
  ACTIVE_SINCE TIMESTAMP(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  COUNTER BIGINT UNSIGNED NOT NULL DEFAULT 0
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