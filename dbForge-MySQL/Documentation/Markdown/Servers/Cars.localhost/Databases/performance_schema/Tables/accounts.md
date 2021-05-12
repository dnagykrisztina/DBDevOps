[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>accounts


# ![logo](../../../../../Images/table64.svg) accounts

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
|[![Indexes ACCOUNT](../../../../../Images/index.svg)](#Indexes)|USER|CHAR|32|||False|False|True|False|False|NULL|False||
|[![Indexes ACCOUNT](../../../../../Images/index.svg)](#Indexes)|HOST|CHAR|255|||False|False|False|False|False|NULL|False||
||CURRENT_CONNECTIONS|BIGINT||20||False|False|False|True|False||False||
||TOTAL_CONNECTIONS|BIGINT||20||False|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||ACCOUNT|USER, HOST|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE accounts (
  USER CHAR(32) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  CURRENT_CONNECTIONS BIGINT NOT NULL,
  TOTAL_CONNECTIONS BIGINT NOT NULL
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE accounts 
  ADD UNIQUE INDEX ACCOUNT(USER, HOST);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial