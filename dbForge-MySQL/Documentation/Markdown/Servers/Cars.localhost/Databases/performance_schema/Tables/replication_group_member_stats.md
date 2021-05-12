[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_group_member_stats


# ![logo](../../../../../Images/table64.svg) replication_group_member_stats

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
||VIEW_ID|CHAR|60|||False|False|True|True|False||False||
||MEMBER_ID|CHAR|36|||False|False|True|True|False||False||
||COUNT_TRANSACTIONS_IN_QUEUE|BIGINT||20||True|False|False|True|False||False||
||COUNT_TRANSACTIONS_CHECKED|BIGINT||20||True|False|False|True|False||False||
||COUNT_CONFLICTS_DETECTED|BIGINT||20||True|False|False|True|False||False||
||COUNT_TRANSACTIONS_ROWS_VALIDATING|BIGINT||20||True|False|False|True|False||False||
||TRANSACTIONS_COMMITTED_ALL_MEMBERS|LONGTEXT||||False|False|False|True|False||False||
||LAST_CONFLICT_FREE_TRANSACTION|TEXT||||False|False|False|True|False||False||
||COUNT_TRANSACTIONS_REMOTE_IN_APPLIER_QUEUE|BIGINT||20||True|False|False|True|False||False||
||COUNT_TRANSACTIONS_REMOTE_APPLIED|BIGINT||20||True|False|False|True|False||False||
||COUNT_TRANSACTIONS_LOCAL_PROPOSED|BIGINT||20||True|False|False|True|False||False||
||COUNT_TRANSACTIONS_LOCAL_ROLLBACK|BIGINT||20||True|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_group_member_stats (
  CHANNEL_NAME CHAR(64) NOT NULL,
  VIEW_ID CHAR(60) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  MEMBER_ID CHAR(36) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  COUNT_TRANSACTIONS_IN_QUEUE BIGINT UNSIGNED NOT NULL,
  COUNT_TRANSACTIONS_CHECKED BIGINT UNSIGNED NOT NULL,
  COUNT_CONFLICTS_DETECTED BIGINT UNSIGNED NOT NULL,
  COUNT_TRANSACTIONS_ROWS_VALIDATING BIGINT UNSIGNED NOT NULL,
  TRANSACTIONS_COMMITTED_ALL_MEMBERS LONGTEXT NOT NULL,
  LAST_CONFLICT_FREE_TRANSACTION TEXT NOT NULL,
  COUNT_TRANSACTIONS_REMOTE_IN_APPLIER_QUEUE BIGINT UNSIGNED NOT NULL,
  COUNT_TRANSACTIONS_REMOTE_APPLIED BIGINT UNSIGNED NOT NULL,
  COUNT_TRANSACTIONS_LOCAL_PROPOSED BIGINT UNSIGNED NOT NULL,
  COUNT_TRANSACTIONS_LOCAL_ROLLBACK BIGINT UNSIGNED NOT NULL
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