[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>replication_connection_configuration


# ![logo](../../../../../Images/table64.svg) replication_connection_configuration

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
||HOST|CHAR|255|||False|False|False|True|False||False||
||PORT|INT||11||False|False|False|True|False||False||
||USER|CHAR|32|||False|False|True|True|False||False||
||NETWORK_INTERFACE|CHAR|60|||False|False|True|True|False||False||
||AUTO_POSITION|ENUM|0|||False|False|False|True|False||False||
||SSL_ALLOWED|ENUM|0|||False|False|False|True|False||False||
||SSL_CA_FILE|VARCHAR|512|||False|False|False|True|False||False||
||SSL_CA_PATH|VARCHAR|512|||False|False|False|True|False||False||
||SSL_CERTIFICATE|VARCHAR|512|||False|False|False|True|False||False||
||SSL_CIPHER|VARCHAR|512|||False|False|False|True|False||False||
||SSL_KEY|VARCHAR|512|||False|False|False|True|False||False||
||SSL_VERIFY_SERVER_CERTIFICATE|ENUM|0|||False|False|False|True|False||False||
||SSL_CRL_FILE|VARCHAR|255|||False|False|False|True|False||False||
||SSL_CRL_PATH|VARCHAR|255|||False|False|False|True|False||False||
||CONNECTION_RETRY_INTERVAL|INT||11||False|False|False|True|False||False||
||CONNECTION_RETRY_COUNT|BIGINT||20||True|False|False|True|False||False||
||HEARTBEAT_INTERVAL|DOUBLE|0|10|3|True|False|False|True|False||False|Number of seconds after which a heartbeat will be sent .|
||TLS_VERSION|VARCHAR|255|||False|False|False|True|False||False||
||PUBLIC_KEY_PATH|VARCHAR|512|||False|False|False|True|False||False||
||GET_PUBLIC_KEY|ENUM|0|||False|False|False|True|False||False||
||NETWORK_NAMESPACE|VARCHAR|64|||False|False|False|True|False||False||
||COMPRESSION_ALGORITHM|CHAR|64|||False|False|True|True|False||False|Compression algorithm used for data transfer between master and slave.|
||ZSTD_COMPRESSION_LEVEL|INT||11||False|False|False|True|False||False|Compression level associated with zstd compression algorithm.|
||TLS_CIPHERSUITES|TEXT||||False|False|True|False|False||False||
||SOURCE_CONNECTION_AUTO_FAILOVER|ENUM|0|||False|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE replication_connection_configuration (
  CHANNEL_NAME CHAR(64) NOT NULL,
  HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PORT INT NOT NULL,
  USER CHAR(32) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  NETWORK_INTERFACE CHAR(60) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  AUTO_POSITION ENUM('1','0') NOT NULL,
  SSL_ALLOWED ENUM('YES','NO','IGNORED') NOT NULL,
  SSL_CA_FILE VARCHAR(512) NOT NULL,
  SSL_CA_PATH VARCHAR(512) NOT NULL,
  SSL_CERTIFICATE VARCHAR(512) NOT NULL,
  SSL_CIPHER VARCHAR(512) NOT NULL,
  SSL_KEY VARCHAR(512) NOT NULL,
  SSL_VERIFY_SERVER_CERTIFICATE ENUM('YES','NO') NOT NULL,
  SSL_CRL_FILE VARCHAR(255) NOT NULL,
  SSL_CRL_PATH VARCHAR(255) NOT NULL,
  CONNECTION_RETRY_INTERVAL INT NOT NULL,
  CONNECTION_RETRY_COUNT BIGINT UNSIGNED NOT NULL,
  HEARTBEAT_INTERVAL DOUBLE(10, 3) UNSIGNED NOT NULL COMMENT 'Number of seconds after which a heartbeat will be sent .',
  TLS_VERSION VARCHAR(255) NOT NULL,
  PUBLIC_KEY_PATH VARCHAR(512) NOT NULL,
  GET_PUBLIC_KEY ENUM('YES','NO') NOT NULL,
  NETWORK_NAMESPACE VARCHAR(64) NOT NULL,
  COMPRESSION_ALGORITHM CHAR(64) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Compression algorithm used for data transfer between master and slave.',
  ZSTD_COMPRESSION_LEVEL INT NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  TLS_CIPHERSUITES TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  SOURCE_CONNECTION_AUTO_FAILOVER ENUM('1','0') NOT NULL,
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