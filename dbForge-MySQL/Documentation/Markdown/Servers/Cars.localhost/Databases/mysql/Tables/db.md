[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>db


# ![logo](../../../../../Images/table64.svg) db

## <a name="#Description"></a>Description
> Database privileges
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
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Db|CHAR|64|||False|False|True|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes User](../../../../../Images/index.svg)](#Indexes)|User|CHAR|32|||False|False|True|True|False|''|False||
||Select_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Insert_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Update_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Delete_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Drop_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Grant_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||References_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Index_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Alter_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_tmp_table_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Lock_tables_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_view_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Show_view_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_routine_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Alter_routine_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Execute_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Event_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Trigger_priv|ENUM|0|||False|False|False|True|False|'N'|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||User|User|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE db (
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  Db CHAR(64) BINARY NOT NULL DEFAULT '',
  User CHAR(32) BINARY NOT NULL DEFAULT '',
  Select_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Insert_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Update_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Delete_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Drop_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Grant_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  References_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Index_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Alter_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_tmp_table_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Lock_tables_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_view_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Show_view_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_routine_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Alter_routine_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Execute_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Event_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Trigger_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (Host, Db, User)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'Database privileges',
STATS_PERSISTENT = 0,
TABLESPACE mysql;

ALTER TABLE db 
  ADD INDEX User(User);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial