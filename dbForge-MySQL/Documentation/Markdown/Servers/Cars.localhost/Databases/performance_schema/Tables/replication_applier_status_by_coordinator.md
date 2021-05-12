[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_applier_status_by_coordinator


# ![logo](../../../../../Images/table64.svg) replication_applier_status_by_coordinator

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
|[![Indexes THREAD_ID](../../../../../Images/index.svg)](#Indexes)|THREAD_ID|BIGINT||20||True|False|False|False|False|NULL|False||
||SERVICE_STATE|ENUM|0|||False|False|False|True|False||False||
||LAST_ERROR_NUMBER|INT||11||False|False|False|True|False||False||
||LAST_ERROR_MESSAGE|VARCHAR|1024|||False|False|False|True|False||False||
||LAST_ERROR_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||LAST_PROCESSED_TRANSACTION|CHAR|57|||False|False|False|False|False|NULL|False||
||LAST_PROCESSED_TRANSACTION_ORIGINAL_COMMIT_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||LAST_PROCESSED_TRANSACTION_IMMEDIATE_COMMIT_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||LAST_PROCESSED_TRANSACTION_START_BUFFER_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||LAST_PROCESSED_TRANSACTION_END_BUFFER_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||PROCESSING_TRANSACTION|CHAR|57|||False|False|False|False|False|NULL|False||
||PROCESSING_TRANSACTION_ORIGINAL_COMMIT_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||PROCESSING_TRANSACTION_IMMEDIATE_COMMIT_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||
||PROCESSING_TRANSACTION_START_BUFFER_TIMESTAMP|TIMESTAMP|0|6||False|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||THREAD_ID|THREAD_ID|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_applier_status_by_coordinator (
  CHANNEL_NAME CHAR(64) NOT NULL,
  THREAD_ID BIGINT UNSIGNED DEFAULT NULL,
  SERVICE_STATE ENUM('ON','OFF') NOT NULL,
  LAST_ERROR_NUMBER INT NOT NULL,
  LAST_ERROR_MESSAGE VARCHAR(1024) NOT NULL,
  LAST_ERROR_TIMESTAMP TIMESTAMP(6) NOT NULL,
  LAST_PROCESSED_TRANSACTION CHAR(57) DEFAULT NULL,
  LAST_PROCESSED_TRANSACTION_ORIGINAL_COMMIT_TIMESTAMP TIMESTAMP(6) NOT NULL,
  LAST_PROCESSED_TRANSACTION_IMMEDIATE_COMMIT_TIMESTAMP TIMESTAMP(6) NOT NULL,
  LAST_PROCESSED_TRANSACTION_START_BUFFER_TIMESTAMP TIMESTAMP(6) NOT NULL,
  LAST_PROCESSED_TRANSACTION_END_BUFFER_TIMESTAMP TIMESTAMP(6) NOT NULL,
  PROCESSING_TRANSACTION CHAR(57) DEFAULT NULL,
  PROCESSING_TRANSACTION_ORIGINAL_COMMIT_TIMESTAMP TIMESTAMP(6) NOT NULL,
  PROCESSING_TRANSACTION_IMMEDIATE_COMMIT_TIMESTAMP TIMESTAMP(6) NOT NULL,
  PROCESSING_TRANSACTION_START_BUFFER_TIMESTAMP TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (CHANNEL_NAME)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE replication_applier_status_by_coordinator 
  ADD INDEX THREAD_ID(THREAD_ID);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial