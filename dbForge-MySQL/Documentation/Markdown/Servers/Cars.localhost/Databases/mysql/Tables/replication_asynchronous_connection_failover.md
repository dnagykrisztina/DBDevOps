[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>replication_asynchronous_connection_failover


# ![logo](../../../../../Images/table64.svg) replication_asynchronous_connection_failover

## <a name="#Description"></a>Description
> The source configuration details
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8|
|Collation|utf8_general_ci|
|Row Format|Dynamic|
|Min Rows|0|
|Max Rows|0|
|Checksum|False|
|Page Checksum|True|
|Pack Keys|False|
|Delay Key Write|False|
|Is Partitioned|False|
|Encryption|False|
|Persistent Statistics|False|
|Auto Recalculate Statistics|DEFAULT|
|Sample Pages|0|
|Created|2021. 04. 10. 15:36:57|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes Channel_name](../../../../../Images/index.svg)](#Indexes)|Channel_name|CHAR|64|||False|False|False|True|False||False|The replication channel name that connects source and replica.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Host|CHAR|255|||False|False|False|True|False||False|The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Port|INT||11||True|False|False|True|False||False|The source port that the replica will attempt to switch over the replication connection to in case of a failure.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Network_namespace|CHAR|64|||False|False|False|True|False||False|The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.|
||Weight|TINYINT||4||True|False|False|True|False||False|The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes Channel_name](../../../../../Images/index.svg)](#Indexes)|Managed_name|CHAR|64|||False|False|False|True|False|''|False|The name of the group which this server belongs to.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||Channel_name|Channel_name, Managed_name|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_asynchronous_connection_failover (
  Channel_name CHAR(64) NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  Port INT UNSIGNED NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  Network_namespace CHAR(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  Weight TINYINT UNSIGNED NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  Managed_name CHAR(64) NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (Channel_name, Host, Port, Network_namespace, Managed_name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'The source configuration details',
STATS_PERSISTENT = 0,
TABLESPACE mysql;

ALTER TABLE replication_asynchronous_connection_failover 
  ADD INDEX Channel_name(Channel_name, Managed_name);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial