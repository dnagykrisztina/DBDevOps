[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>role_edges


# ![logo](../../../../../Images/table64.svg) role_edges

## <a name="#Description"></a>Description
> Role hierarchy and role grants
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|FROM_HOST|CHAR|255|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|FROM_USER|CHAR|32|||False|False|True|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|TO_HOST|CHAR|255|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|TO_USER|CHAR|32|||False|False|True|True|False|''|False||
||WITH_ADMIN_OPTION|ENUM|0|||False|False|False|True|False|'N'|False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE role_edges (
  FROM_HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  FROM_USER CHAR(32) BINARY NOT NULL DEFAULT '',
  TO_HOST CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  TO_USER CHAR(32) BINARY NOT NULL DEFAULT '',
  WITH_ADMIN_OPTION ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (FROM_HOST, FROM_USER, TO_HOST, TO_USER)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'Role hierarchy and role grants',
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