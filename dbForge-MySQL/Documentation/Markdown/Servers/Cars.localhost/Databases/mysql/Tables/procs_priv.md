[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>procs_priv


# ![logo](../../../../../Images/table64.svg) procs_priv

## <a name="#Description"></a>Description
> Procedure privileges
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
|Created|2021. 04. 10. 15:36:57|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Host|CHAR|255|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Db|CHAR|64|||False|False|True|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|User|CHAR|32|||False|False|True|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Routine_name|CHAR|64|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Routine_type|ENUM|0|||False|False|True|True|False||False||
|[![Indexes Grantor](../../../../../Images/index.svg)](#Indexes)|Grantor|VARCHAR|288|||False|False|True|True|False|''|False||
||Proc_priv|SET|0|||False|False|False|True|False|''|False||
||Timestamp|TIMESTAMP|0|||False|False|False|True|False|CURRENT_TIMESTAMP|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||Grantor|Grantor|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE procs_priv (
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  Db CHAR(64) BINARY NOT NULL DEFAULT '',
  User CHAR(32) BINARY NOT NULL DEFAULT '',
  Routine_name CHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  Routine_type ENUM('FUNCTION','PROCEDURE') NOT NULL,
  Grantor VARCHAR(288) BINARY NOT NULL DEFAULT '',
  Proc_priv SET('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (Host, Db, User, Routine_name, Routine_type)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'Procedure privileges',
STATS_PERSISTENT = 0,
TABLESPACE mysql;

ALTER TABLE procs_priv 
  ADD INDEX Grantor(Grantor);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial