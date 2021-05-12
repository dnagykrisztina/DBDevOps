[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>host_cache


# ![logo](../../../../../Images/table64.svg) host_cache

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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|IP|VARCHAR|64|||False|False|False|True|False||False||
|[![Indexes HOST](../../../../../Images/index.svg)](#Indexes)|HOST|VARCHAR|255|||False|False|False|False|False|NULL|False||
||HOST_VALIDATED|ENUM|0|||False|False|False|True|False||False||
||SUM_CONNECT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_HOST_BLOCKED_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_NAMEINFO_TRANSIENT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_NAMEINFO_PERMANENT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_FORMAT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_ADDRINFO_TRANSIENT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_ADDRINFO_PERMANENT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_FCRDNS_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_HOST_ACL_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_NO_AUTH_PLUGIN_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_AUTH_PLUGIN_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_HANDSHAKE_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_PROXY_USER_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_PROXY_USER_ACL_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_AUTHENTICATION_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_SSL_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_MAX_USER_CONNECTIONS_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_MAX_USER_CONNECTIONS_PER_HOUR_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_DEFAULT_DATABASE_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_INIT_CONNECT_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_LOCAL_ERRORS|BIGINT||20||False|False|False|True|False||False||
||COUNT_UNKNOWN_ERRORS|BIGINT||20||False|False|False|True|False||False||
||FIRST_SEEN|TIMESTAMP|0|||False|False|False|True|False|'0000-00-00 00:00:00'|False||
||LAST_SEEN|TIMESTAMP|0|||False|False|False|True|False|'0000-00-00 00:00:00'|False||
||FIRST_ERROR_SEEN|TIMESTAMP|0|||False|False|False|False|False|'0000-00-00 00:00:00'|False||
||LAST_ERROR_SEEN|TIMESTAMP|0|||False|False|False|False|False|'0000-00-00 00:00:00'|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||HOST|HOST|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE host_cache (
  IP VARCHAR(64) NOT NULL,
  HOST VARCHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  HOST_VALIDATED ENUM('YES','NO') NOT NULL,
  SUM_CONNECT_ERRORS BIGINT NOT NULL,
  COUNT_HOST_BLOCKED_ERRORS BIGINT NOT NULL,
  COUNT_NAMEINFO_TRANSIENT_ERRORS BIGINT NOT NULL,
  COUNT_NAMEINFO_PERMANENT_ERRORS BIGINT NOT NULL,
  COUNT_FORMAT_ERRORS BIGINT NOT NULL,
  COUNT_ADDRINFO_TRANSIENT_ERRORS BIGINT NOT NULL,
  COUNT_ADDRINFO_PERMANENT_ERRORS BIGINT NOT NULL,
  COUNT_FCRDNS_ERRORS BIGINT NOT NULL,
  COUNT_HOST_ACL_ERRORS BIGINT NOT NULL,
  COUNT_NO_AUTH_PLUGIN_ERRORS BIGINT NOT NULL,
  COUNT_AUTH_PLUGIN_ERRORS BIGINT NOT NULL,
  COUNT_HANDSHAKE_ERRORS BIGINT NOT NULL,
  COUNT_PROXY_USER_ERRORS BIGINT NOT NULL,
  COUNT_PROXY_USER_ACL_ERRORS BIGINT NOT NULL,
  COUNT_AUTHENTICATION_ERRORS BIGINT NOT NULL,
  COUNT_SSL_ERRORS BIGINT NOT NULL,
  COUNT_MAX_USER_CONNECTIONS_ERRORS BIGINT NOT NULL,
  COUNT_MAX_USER_CONNECTIONS_PER_HOUR_ERRORS BIGINT NOT NULL,
  COUNT_DEFAULT_DATABASE_ERRORS BIGINT NOT NULL,
  COUNT_INIT_CONNECT_ERRORS BIGINT NOT NULL,
  COUNT_LOCAL_ERRORS BIGINT NOT NULL,
  COUNT_UNKNOWN_ERRORS BIGINT NOT NULL,
  FIRST_SEEN TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  LAST_SEEN TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  FIRST_ERROR_SEEN TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  LAST_ERROR_SEEN TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (IP)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE host_cache 
  ADD INDEX HOST(HOST);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial