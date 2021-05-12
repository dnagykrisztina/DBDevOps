[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_asynchronous_connection_failover


# ![logo](../../../../../Images/table64.svg) replication_asynchronous_connection_failover

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes CHANNEL_NAME](../../../../../Images/index.svg)](#Indexes)|CHANNEL_NAME|CHAR|64|||False|False|False|True|False||False|The replication channel name that connects source and replica.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|HOST|CHAR|255|||False|False|False|True|False||False|The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|PORT|INT||11||False|False|False|True|False||False|The source port that the replica will attempt to switch over the replication connection to in case of a failure.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|NETWORK_NAMESPACE|CHAR|64|||False|False|False|True|False||False|The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.|
||WEIGHT|INT||11||True|False|False|True|False||False|The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes CHANNEL_NAME](../../../../../Images/index.svg)](#Indexes)|MANAGED_NAME|CHAR|64|||False|False|False|True|False|''|False|The name of the group which this server belongs to.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||CHANNEL_NAME|CHANNEL_NAME, MANAGED_NAME|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_asynchronous_connection_failover (
  CHANNEL_NAME CHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  PORT INT NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  NETWORK_NAMESPACE CHAR(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  WEIGHT INT UNSIGNED NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  MANAGED_NAME CHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (CHANNEL_NAME, HOST, PORT, NETWORK_NAMESPACE, MANAGED_NAME)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE replication_asynchronous_connection_failover 
  ADD INDEX CHANNEL_NAME(CHANNEL_NAME, MANAGED_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial