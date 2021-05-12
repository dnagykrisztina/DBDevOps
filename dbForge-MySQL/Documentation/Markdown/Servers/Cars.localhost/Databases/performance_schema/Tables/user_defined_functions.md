[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>user_defined_functions


# ![logo](../../../../../Images/table64.svg) user_defined_functions

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|UDF_NAME|VARCHAR|64|||False|False|False|True|False||False||
||UDF_RETURN_TYPE|VARCHAR|20|||False|False|False|True|False||False||
||UDF_TYPE|VARCHAR|20|||False|False|False|True|False||False||
||UDF_LIBRARY|VARCHAR|1024|||False|False|False|False|False|NULL|False||
||UDF_USAGE_COUNT|BIGINT||20||False|False|False|False|False|NULL|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE user_defined_functions (
  UDF_NAME VARCHAR(64) NOT NULL,
  UDF_RETURN_TYPE VARCHAR(20) NOT NULL,
  UDF_TYPE VARCHAR(20) NOT NULL,
  UDF_LIBRARY VARCHAR(1024) DEFAULT NULL,
  UDF_USAGE_COUNT BIGINT DEFAULT NULL,
  PRIMARY KEY (UDF_NAME)
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