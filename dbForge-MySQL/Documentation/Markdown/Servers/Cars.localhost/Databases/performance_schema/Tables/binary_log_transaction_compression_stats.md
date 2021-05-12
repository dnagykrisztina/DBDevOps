[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>binary_log_transaction_compression_stats


# ![logo](../../../../../Images/table64.svg) binary_log_transaction_compression_stats

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
||LOG_TYPE|ENUM|0|||False|False|False|True|False||False|The log type to which the transactions were written.|
||COMPRESSION_TYPE|VARCHAR|64|||False|False|False|True|False||False|The transaction compression algorithm used.|
||TRANSACTION_COUNTER|BIGINT||20||True|False|False|True|False||False|Number of transactions written to the log|
||COMPRESSED_BYTES_COUNTER|BIGINT||20||True|False|False|True|False||False|The total number of bytes compressed.|
||UNCOMPRESSED_BYTES_COUNTER|BIGINT||20||True|False|False|True|False||False|The total number of bytes uncompressed.|
||COMPRESSION_PERCENTAGE|SMALLINT||6||False|False|False|True|False||False|The compression ratio as a percentage.|
||FIRST_TRANSACTION_ID|TEXT||||False|False|False|False|False||False|The first transaction written.|
||FIRST_TRANSACTION_COMPRESSED_BYTES|BIGINT||20||True|False|False|True|False||False|First transaction written compressed bytes.|
||FIRST_TRANSACTION_UNCOMPRESSED_BYTES|BIGINT||20||True|False|False|True|False||False|First transaction written uncompressed bytes.|
||FIRST_TRANSACTION_TIMESTAMP|TIMESTAMP|0|6||False|False|False|False|False|NULL|False|When the first transaction was written.|
||LAST_TRANSACTION_ID|TEXT||||False|False|False|False|False||False|The last transaction written.|
||LAST_TRANSACTION_COMPRESSED_BYTES|BIGINT||20||True|False|False|True|False||False|Last transaction written compressed bytes.|
||LAST_TRANSACTION_UNCOMPRESSED_BYTES|BIGINT||20||True|False|False|True|False||False|Last transaction written uncompressed bytes.|
||LAST_TRANSACTION_TIMESTAMP|TIMESTAMP|0|6||False|False|False|False|False|NULL|False|When the last transaction was written.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE binary_log_transaction_compression_stats (
  LOG_TYPE ENUM('BINARY','RELAY') NOT NULL COMMENT 'The log type to which the transactions were written.',
  COMPRESSION_TYPE VARCHAR(64) NOT NULL COMMENT 'The transaction compression algorithm used.',
  TRANSACTION_COUNTER BIGINT UNSIGNED NOT NULL COMMENT 'Number of transactions written to the log',
  COMPRESSED_BYTES_COUNTER BIGINT UNSIGNED NOT NULL COMMENT 'The total number of bytes compressed.',
  UNCOMPRESSED_BYTES_COUNTER BIGINT UNSIGNED NOT NULL COMMENT 'The total number of bytes uncompressed.',
  COMPRESSION_PERCENTAGE SMALLINT NOT NULL COMMENT 'The compression ratio as a percentage.',
  FIRST_TRANSACTION_ID TEXT DEFAULT NULL COMMENT 'The first transaction written.',
  FIRST_TRANSACTION_COMPRESSED_BYTES BIGINT UNSIGNED NOT NULL COMMENT 'First transaction written compressed bytes.',
  FIRST_TRANSACTION_UNCOMPRESSED_BYTES BIGINT UNSIGNED NOT NULL COMMENT 'First transaction written uncompressed bytes.',
  FIRST_TRANSACTION_TIMESTAMP TIMESTAMP(6) NULL DEFAULT NULL COMMENT 'When the first transaction was written.',
  LAST_TRANSACTION_ID TEXT DEFAULT NULL COMMENT 'The last transaction written.',
  LAST_TRANSACTION_COMPRESSED_BYTES BIGINT UNSIGNED NOT NULL COMMENT 'Last transaction written compressed bytes.',
  LAST_TRANSACTION_UNCOMPRESSED_BYTES BIGINT UNSIGNED NOT NULL COMMENT 'Last transaction written uncompressed bytes.',
  LAST_TRANSACTION_TIMESTAMP TIMESTAMP(6) NULL DEFAULT NULL COMMENT 'When the last transaction was written.'
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