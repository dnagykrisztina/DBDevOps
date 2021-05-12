[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>gtid_executed


# ![logo](../../../../../Images/table64.svg) gtid_executed

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_0900_ai_ci|
|Row Format|Dynamic|
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
|Created|2021. 04. 10. 15:36:57|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|source_uuid|CHAR|36|||False|False|False|True|False||False|uuid of the source where the transaction was originally executed.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|interval_start|BIGINT||20||False|False|False|True|False||False|First number of interval.|
||interval_end|BIGINT||20||False|False|False|True|False||False|Last number of interval.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE gtid_executed (
  source_uuid CHAR(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  interval_start BIGINT NOT NULL COMMENT 'First number of interval.',
  interval_end BIGINT NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (source_uuid, interval_start)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
TABLESPACE mysql;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial