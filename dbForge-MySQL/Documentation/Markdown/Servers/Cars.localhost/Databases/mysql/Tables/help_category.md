[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>help_category


# ![logo](../../../../../Images/table64.svg) help_category

## <a name="#Description"></a>Description
> help categories
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
|Created|2021. 04. 10. 15:36:56|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|help_category_id|SMALLINT||6||True|False|False|True|False||False||
|[![Indexes name](../../../../../Images/index.svg)](#Indexes)|name|CHAR|64|||False|False|False|True|False||False||
||parent_category_id|SMALLINT||6||True|False|False|False|False|NULL|False||
||url|TEXT||||False|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||name|name|True|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE help_category (
  help_category_id SMALLINT UNSIGNED NOT NULL,
  name CHAR(64) NOT NULL,
  parent_category_id SMALLINT UNSIGNED DEFAULT NULL,
  url TEXT NOT NULL,
  PRIMARY KEY (help_category_id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'help categories',
STATS_PERSISTENT = 0,
TABLESPACE mysql;

ALTER TABLE help_category 
  ADD UNIQUE INDEX name(name);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial