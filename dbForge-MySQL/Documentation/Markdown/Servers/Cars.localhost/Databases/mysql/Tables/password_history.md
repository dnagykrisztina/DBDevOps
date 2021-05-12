[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>password_history


# ![logo](../../../../../Images/table64.svg) password_history

## <a name="#Description"></a>Description
> Password history for user accounts
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Host|CHAR|255|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|User|CHAR|32|||False|False|True|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Password_timestamp|TIMESTAMP|0|6||False|False|False|True|False|CURRENT_TIMESTAMP(6)|False||
||Password|TEXT||||False|False|True|False|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE password_history (
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  User CHAR(32) BINARY NOT NULL DEFAULT '',
  Password_timestamp TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  Password TEXT BINARY DEFAULT NULL,
  PRIMARY KEY (Host, User, Password_timestamp)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'Password history for user accounts',
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