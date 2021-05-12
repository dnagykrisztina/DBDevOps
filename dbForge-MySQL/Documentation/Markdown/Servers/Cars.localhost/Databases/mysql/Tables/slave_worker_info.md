[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>slave_worker_info


# ![logo](../../../../../Images/table64.svg) slave_worker_info

## <a name="#Description"></a>Description
> Worker Information
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Id|INT||11||True|False|False|True|False||False||
||Relay_log_name|TEXT||||False|False|True|True|False||False||
||Relay_log_pos|BIGINT||20||True|False|False|True|False||False||
||Master_log_name|TEXT||||False|False|True|True|False||False||
||Master_log_pos|BIGINT||20||True|False|False|True|False||False||
||Checkpoint_relay_log_name|TEXT||||False|False|True|True|False||False||
||Checkpoint_relay_log_pos|BIGINT||20||True|False|False|True|False||False||
||Checkpoint_master_log_name|TEXT||||False|False|True|True|False||False||
||Checkpoint_master_log_pos|BIGINT||20||True|False|False|True|False||False||
||Checkpoint_seqno|INT||11||True|False|False|True|False||False||
||Checkpoint_group_size|INT||11||True|False|False|True|False||False||
||Checkpoint_group_bitmap|BLOB|0|||False|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Channel_name|CHAR|64|||False|False|False|True|False||False|The channel on which the slave is connected to a source. Used in Multisource Replication|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE slave_worker_info (
  Id INT UNSIGNED NOT NULL,
  Relay_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  Relay_log_pos BIGINT UNSIGNED NOT NULL,
  Master_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  Master_log_pos BIGINT UNSIGNED NOT NULL,
  Checkpoint_relay_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  Checkpoint_relay_log_pos BIGINT UNSIGNED NOT NULL,
  Checkpoint_master_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  Checkpoint_master_log_pos BIGINT UNSIGNED NOT NULL,
  Checkpoint_seqno INT UNSIGNED NOT NULL,
  Checkpoint_group_size INT UNSIGNED NOT NULL,
  Checkpoint_group_bitmap BLOB NOT NULL,
  Channel_name CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (Channel_name, Id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Worker Information',
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