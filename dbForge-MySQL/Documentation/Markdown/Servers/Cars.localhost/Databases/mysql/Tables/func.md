[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>func


# ![logo](../../../../../Images/table64.svg) func

## <a name="#Description"></a>Description
> User defined functions
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8|
|Collation|utf8_bin|
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
|Created|2021. 04. 10. 15:36:56|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|name|CHAR|64|||False|False|True|True|False|''|False||
||ret|TINYINT||4||False|False|False|True|False|'0'|False||
||dl|CHAR|128|||False|False|True|True|False|''|False||
||type|ENUM|0|||False|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE func (
  name CHAR(64) BINARY NOT NULL DEFAULT '',
  ret TINYINT NOT NULL DEFAULT 0,
  dl CHAR(128) BINARY NOT NULL DEFAULT '',
  type ENUM('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'User defined functions',
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