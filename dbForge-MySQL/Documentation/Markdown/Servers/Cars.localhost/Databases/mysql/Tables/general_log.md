[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>general_log


# ![logo](../../../../../Images/table64.svg) general_log

## <a name="#Description"></a>Description
> General log
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
||event_time|TIMESTAMP|0|6||False|False|False|True|False|CURRENT_TIMESTAMP(6)|False||
||user_host|MEDIUMTEXT||||False|False|False|True|False||False||
||thread_id|BIGINT||20||True|False|False|True|False||False||
||server_id|INT||11||True|False|False|True|False||False||
||command_type|VARCHAR|64|||False|False|False|True|False||False||
||argument|MEDIUMBLOB|0|||False|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE general_log (
  event_time TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  user_host MEDIUMTEXT NOT NULL,
  thread_id BIGINT UNSIGNED NOT NULL,
  server_id INT UNSIGNED NOT NULL,
  command_type VARCHAR(64) NOT NULL,
  argument MEDIUMBLOB NOT NULL
)
ENGINE = CSV,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'General log';
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial