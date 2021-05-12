[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_group_members


# ![logo](../../../../../Images/table64.svg) replication_group_members

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
||MEMBER_ID|CHAR|36|||False|False|True|True|False||False||
||MEMBER_HOST|CHAR|255|||False|False|False|True|False||False||
||MEMBER_PORT|INT||11||False|False|False|False|False|NULL|False||
||MEMBER_STATE|CHAR|64|||False|False|True|True|False||False||
||MEMBER_ROLE|CHAR|64|||False|False|True|True|False||False||
||MEMBER_VERSION|CHAR|64|||False|False|True|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_group_members (
  CHANNEL_NAME CHAR(64) NOT NULL,
  MEMBER_ID CHAR(36) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  MEMBER_HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  MEMBER_PORT INT DEFAULT NULL,
  MEMBER_STATE CHAR(64) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  MEMBER_ROLE CHAR(64) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  MEMBER_VERSION CHAR(64) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
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