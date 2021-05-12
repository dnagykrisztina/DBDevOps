[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>slave_master_info


# ![logo](../../../../../Images/table64.svg) slave_master_info

## <a name="#Description"></a>Description
> Master Information
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
||Number_of_lines|INT||11||True|False|False|True|False||False|Number of lines in the file.|
||Master_log_name|TEXT||||False|False|True|True|False||False|The name of the master binary log currently being read from the master.|
||Master_log_pos|BIGINT||20||True|False|False|True|False||False|The master log position of the last read event.|
||Host|CHAR|255|||False|False|False|False|False|NULL|False|The host name of the master.|
||User_name|TEXT||||False|False|True|False|False||False|The user name used to connect to the master.|
||User_password|TEXT||||False|False|True|False|False||False|The password used to connect to the master.|
||Port|INT||11||True|False|False|True|False||False|The network port used to connect to the master.|
||Connect_retry|INT||11||True|False|False|True|False||False|The period (in seconds) that the slave will wait before trying to reconnect to the master.|
||Enabled_ssl|TINYINT||1||False|False|False|True|False||False|Indicates whether the server supports SSL connections.|
||Ssl_ca|TEXT||||False|False|True|False|False||False|The file used for the Certificate Authority (CA) certificate.|
||Ssl_capath|TEXT||||False|False|True|False|False||False|The path to the Certificate Authority (CA) certificates.|
||Ssl_cert|TEXT||||False|False|True|False|False||False|The name of the SSL certificate file.|
||Ssl_cipher|TEXT||||False|False|True|False|False||False|The name of the cipher in use for the SSL connection.|
||Ssl_key|TEXT||||False|False|True|False|False||False|The name of the SSL key file.|
||Ssl_verify_server_cert|TINYINT||1||False|False|False|True|False||False|Whether to verify the server certificate.|
||Heartbeat|FLOAT|0|||False|False|False|True|False||False||
||Bind|TEXT||||False|False|True|False|False||False|Displays which interface is employed when connecting to the MySQL server|
||Ignored_server_ids|TEXT||||False|False|True|False|False||False|The number of server IDs to be ignored, followed by the actual server IDs|
||Uuid|TEXT||||False|False|True|False|False||False|The master server uuid.|
||Retry_count|BIGINT||20||True|False|False|True|False||False|Number of reconnect attempts, to the master, before giving up.|
||Ssl_crl|TEXT||||False|False|True|False|False||False|The file used for the Certificate Revocation List (CRL)|
||Ssl_crlpath|TEXT||||False|False|True|False|False||False|The path used for Certificate Revocation List (CRL) files|
||Enabled_auto_position|TINYINT||1||False|False|False|True|False||False|Indicates whether GTIDs will be used to retrieve events from the master.|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Channel_name|CHAR|64|||False|False|False|True|False||False|The channel on which the slave is connected to a source. Used in Multisource Replication|
||Tls_version|TEXT||||False|False|True|False|False||False|Tls version|
||Public_key_path|TEXT||||False|False|True|False|False||False|The file containing public key of master server.|
||Get_public_key|TINYINT||1||False|False|False|True|False||False|Preference to get public key from master.|
||Network_namespace|TEXT||||False|False|True|False|False||False|Network namespace used for communication with the master server.|
||Master_compression_algorithm|CHAR|64|||False|False|True|True|False||False|Compression algorithm supported for data transfer between master and slave.|
||Master_zstd_compression_level|INT||11||True|False|False|True|False||False|Compression level associated with zstd compression algorithm.|
||Tls_ciphersuites|TEXT||||False|False|True|False|False||False|Ciphersuites used for TLS 1.3 communication with the master server.|
||Source_connection_auto_failover|TINYINT||1||False|False|False|True|False|'0'|False|Indicates whether the channel connection failover is enabled.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE slave_master_info (
  Number_of_lines INT UNSIGNED NOT NULL COMMENT 'Number of lines in the file.',
  Master_log_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  Master_log_pos BIGINT UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.',
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the master.',
  User_name TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The user name used to connect to the master.',
  User_password TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The password used to connect to the master.',
  Port INT UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.',
  Connect_retry INT UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  Enabled_ssl TINYINT(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  Ssl_ca TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  Ssl_capath TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The path to the Certificate Authority (CA) certificates.',
  Ssl_cert TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the SSL certificate file.',
  Ssl_cipher TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the cipher in use for the SSL connection.',
  Ssl_key TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the SSL key file.',
  Ssl_verify_server_cert TINYINT(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  Heartbeat FLOAT NOT NULL,
  Bind TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  Ignored_server_ids TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  Uuid TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The master server uuid.',
  Retry_count BIGINT UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  Ssl_crl TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The file used for the Certificate Revocation List (CRL)',
  Ssl_crlpath TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The path used for Certificate Revocation List (CRL) files',
  Enabled_auto_position TINYINT(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  Channel_name CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  Tls_version TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Tls version',
  Public_key_path TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The file containing public key of master server.',
  Get_public_key TINYINT(1) NOT NULL COMMENT 'Preference to get public key from master.',
  Network_namespace TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Network namespace used for communication with the master server.',
  Master_compression_algorithm CHAR(64) BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between master and slave.',
  Master_zstd_compression_level INT UNSIGNED NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  Tls_ciphersuites TEXT BINARY CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  Source_connection_auto_failover TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Indicates whether the channel connection failover is enabled.',
  PRIMARY KEY (Channel_name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Master Information',
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