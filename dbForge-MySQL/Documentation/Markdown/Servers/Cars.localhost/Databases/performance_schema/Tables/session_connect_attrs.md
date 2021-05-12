[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>session_connect_attrs


# ![logo](../../../../../Images/table64.svg) session_connect_attrs

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|PERFORMANCE_SCHEMA|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_bin|
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|PROCESSLIST_ID|BIGINT||20||True|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|ATTR_NAME|VARCHAR|32|||False|False|True|True|False||False||
||ATTR_VALUE|VARCHAR|1024|||False|False|True|False|False|NULL|False||
||ORDINAL_POSITION|INT||11||False|False|False|False|False|NULL|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE session_connect_attrs (
  PROCESSLIST_ID BIGINT UNSIGNED NOT NULL,
  ATTR_NAME VARCHAR(32) BINARY NOT NULL,
  ATTR_VALUE VARCHAR(1024) BINARY DEFAULT NULL,
  ORDINAL_POSITION INT DEFAULT NULL,
  PRIMARY KEY (PROCESSLIST_ID, ATTR_NAME)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_bin;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial