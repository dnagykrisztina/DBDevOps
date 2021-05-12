[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>slow_log


# ![logo](../../../../../Images/table64.svg) slow_log

## <a name="#Description"></a>Description
> Slow log
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|CSV|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8|
|Collation|utf8_general_ci|
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
|Created|2021. 04. 10. 15:36:57|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
||start_time|TIMESTAMP|0|6||False|False|False|True|False|CURRENT_TIMESTAMP(6)|False||
||user_host|MEDIUMTEXT||||False|False|False|True|False||False||
||query_time|TIME|0|6||False|False|False|True|False||False||
||lock_time|TIME|0|6||False|False|False|True|False||False||
||rows_sent|INT||11||False|False|False|True|False||False||
||rows_examined|INT||11||False|False|False|True|False||False||
||db|VARCHAR|512|||False|False|False|True|False||False||
||last_insert_id|INT||11||False|False|False|True|False||False||
||insert_id|INT||11||False|False|False|True|False||False||
||server_id|INT||11||True|False|False|True|False||False||
||sql_text|MEDIUMBLOB|0|||False|False|False|True|False||False||
||thread_id|BIGINT||20||True|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE slow_log (
  start_time TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  user_host MEDIUMTEXT NOT NULL,
  query_time TIME(6) NOT NULL,
  lock_time TIME(6) NOT NULL,
  rows_sent INT NOT NULL,
  rows_examined INT NOT NULL,
  db VARCHAR(512) NOT NULL,
  last_insert_id INT NOT NULL,
  insert_id INT NOT NULL,
  server_id INT UNSIGNED NOT NULL,
  sql_text MEDIUMBLOB NOT NULL,
  thread_id BIGINT UNSIGNED NOT NULL
)
ENGINE = CSV,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Slow log';
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial