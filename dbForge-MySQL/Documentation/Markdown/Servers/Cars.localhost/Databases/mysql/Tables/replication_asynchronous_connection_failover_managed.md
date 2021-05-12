[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>replication_asynchronous_connection_failover_managed


# ![logo](../../../../../Images/table64.svg) replication_asynchronous_connection_failover_managed

## <a name="#Description"></a>Description
> The managed source configuration details
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Channel_name|CHAR|64|||False|False|False|True|False||False|The replication channel name that connects source and replica.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Managed_name|CHAR|64|||False|False|False|True|False|''|False|The name of the source which needs to be managed.|
||Managed_type|CHAR|64|||False|False|False|True|False|''|False|Determines the managed type.|
||Configuration|JSON|0|||False|False|False|False|False|NULL|False|The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_asynchronous_connection_failover_managed (
  Channel_name CHAR(64) NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  Managed_name CHAR(64) NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  Managed_type CHAR(64) NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  Configuration JSON DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (Channel_name, Managed_name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'The managed source configuration details',
STATS_PERSISTENT = 0,
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