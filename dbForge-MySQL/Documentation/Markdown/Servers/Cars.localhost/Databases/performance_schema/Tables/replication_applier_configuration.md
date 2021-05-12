[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_applier_configuration


# ![logo](../../../../../Images/table64.svg) replication_applier_configuration

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|CHANNEL_NAME|CHAR|64|||False|False|False|True|False||False||
||DESIRED_DELAY|INT||11||False|False|False|True|False||False||
||PRIVILEGE_CHECKS_USER|TEXT||||False|False|True|False|False||False|User name for the security context of the applier.|
||REQUIRE_ROW_FORMAT|ENUM|0|||False|False|False|True|False||False|Indicates whether the channel shall only accept row based events.|
||REQUIRE_TABLE_PRIMARY_KEY_CHECK|ENUM|0|||False|False|False|True|False||False|Indicates what is the channel policy regarding tables having primary keys on create and alter table queries|
||ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS_TYPE|ENUM|0|||False|False|False|True|False||False|Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value|
||ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS_VALUE|TEXT||||False|False|True|False|False||False|Indicates the UUID used while generating GTIDs for anonymous transactions|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_applier_configuration (
  CHANNEL_NAME CHAR(64) NOT NULL,
  DESIRED_DELAY INT NOT NULL,
  PRIVILEGE_CHECKS_USER TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User name for the security context of the applier.',
  REQUIRE_ROW_FORMAT ENUM('YES','NO') NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  REQUIRE_TABLE_PRIMARY_KEY_CHECK ENUM('STREAM','ON','OFF') NOT NULL COMMENT 'Indicates what is the channel policy regarding tables having primary keys on create and alter table queries',
  ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS_TYPE ENUM('OFF','LOCAL','UUID') NOT NULL COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS_VALUE TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (CHANNEL_NAME)
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