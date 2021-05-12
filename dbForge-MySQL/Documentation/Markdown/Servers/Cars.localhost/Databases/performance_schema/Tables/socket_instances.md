[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>socket_instances


# ![logo](../../../../../Images/table64.svg) socket_instances

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
||EVENT_NAME|VARCHAR|128|||False|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||
|[![Indexes THREAD_ID](../../../../../Images/index.svg)](#Indexes)|THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
|[![Indexes SOCKET_ID](../../../../../Images/index.svg)](#Indexes)|SOCKET_ID|INT||11||False|False|False|True|False||False||
|[![Indexes IP](../../../../../Images/index.svg)](#Indexes)|IP|VARCHAR|64|||False|False|False|True|False||False||
|[![Indexes IP](../../../../../Images/index.svg)](#Indexes)|PORT|INT||11||False|False|False|True|False||False||
||STATE|ENUM|0|||False|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||THREAD_ID|THREAD_ID|False|None||
||SOCKET_ID|SOCKET_ID|False|None||
||IP|IP, PORT|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE socket_instances (
  EVENT_NAME VARCHAR(128) NOT NULL,
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL,
  THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  SOCKET_ID INT NOT NULL,
  IP VARCHAR(64) NOT NULL,
  PORT INT NOT NULL,
  STATE ENUM('IDLE','ACTIVE') NOT NULL,
  PRIMARY KEY (OBJECT_INSTANCE_BEGIN)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE socket_instances 
  ADD INDEX THREAD_ID(THREAD_ID);

ALTER TABLE socket_instances 
  ADD INDEX SOCKET_ID(SOCKET_ID);

ALTER TABLE socket_instances 
  ADD INDEX IP(IP, PORT);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial