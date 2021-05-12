[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>slave_relay_log_info


# ![logo](../../../../../Images/table64.svg) slave_relay_log_info

## <a name="#Description"></a>Description
> Relay Log Information
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
||Number_of_lines|INT||11||True|False|False|True|False||False|Number of lines in the file or rows in the table. Used to version table definitions.|
||Relay_log_name|TEXT||||False|False|True|False|False||False|The name of the current relay log file.|
||Relay_log_pos|BIGINT||20||True|False|False|False|False|NULL|False|The relay log position of the last executed event.|
||Master_log_name|TEXT||||False|False|True|False|False||False|The name of the master binary log file from which the events in the relay log file were read.|
||Master_log_pos|BIGINT||20||True|False|False|False|False|NULL|False|The master log position of the last executed event.|
||Sql_delay|INT||11||False|False|False|False|False|NULL|False|The number of seconds that the slave must lag behind the master.|
||Number_of_workers|INT||11||True|False|False|False|False|NULL|False||
||Id|INT||11||True|False|False|False|False|NULL|False|Internal Id that uniquely identifies this record.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Channel_name|CHAR|64|||False|False|False|True|False||False|The channel on which the slave is connected to a source. Used in Multisource Replication|
||Privilege_checks_username|CHAR|32|||False|False|True|False|False|NULL|False|Username part of PRIVILEGE_CHECKS_USER.|
||Privilege_checks_hostname|CHAR|255|||False|False|False|False|False|NULL|False|Hostname part of PRIVILEGE_CHECKS_USER.|
||Require_row_format|TINYINT||1||False|False|False|True|False||False|Indicates whether the channel shall only accept row based events.|
||Require_table_primary_key_check|ENUM|0|||False|False|False|True|False|'STREAM'|False|Indicates what is the channel policy regarding tables having primary keys on create and alter table queries|
||Assign_gtids_to_anonymous_transactions_type|ENUM|0|||False|False|False|True|False|'OFF'|False|Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value|
||Assign_gtids_to_anonymous_transactions_value|TEXT||||False|False|True|False|False||False|Indicates the UUID used while generating GTIDs for anonymous transactions|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE slave_relay_log_info (
  Number_of_lines INT UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  Relay_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the current relay log file.',
  Relay_log_pos BIGINT UNSIGNED DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  Master_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  Master_log_pos BIGINT UNSIGNED DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  Sql_delay INT DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  Number_of_workers INT UNSIGNED DEFAULT NULL,
  Id INT UNSIGNED DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  Channel_name CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  Privilege_checks_username CHAR(32) BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  Privilege_checks_hostname CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  Require_row_format TINYINT(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  Require_table_primary_key_check ENUM('STREAM','ON','OFF') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables having primary keys on create and alter table queries',
  Assign_gtids_to_anonymous_transactions_type ENUM('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  Assign_gtids_to_anonymous_transactions_value TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (Channel_name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Relay Log Information',
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