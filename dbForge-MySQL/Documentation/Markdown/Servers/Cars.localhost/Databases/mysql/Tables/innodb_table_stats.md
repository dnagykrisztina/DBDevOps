[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>innodb_table_stats


# ![logo](../../../../../Images/table64.svg) innodb_table_stats

## <a name="#Description"></a>Description
> 
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
|Created|2021. 04. 10. 15:36:50|
|Last Modified|2021. 04. 10. 15:46:45|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|database_name|VARCHAR|64|||False|False|True|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|table_name|VARCHAR|199|||False|False|True|True|False||False||
||last_update|TIMESTAMP|0|||False|False|False|True|False|CURRENT_TIMESTAMP|False||
||n_rows|BIGINT||20||True|False|False|True|False||False||
||clustered_index_size|BIGINT||20||True|False|False|True|False||False||
||sum_of_other_index_sizes|BIGINT||20||True|False|False|True|False||False||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE innodb_table_stats (
  database_name VARCHAR(64) BINARY NOT NULL,
  table_name VARCHAR(199) BINARY NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  n_rows BIGINT UNSIGNED NOT NULL,
  clustered_index_size BIGINT UNSIGNED NOT NULL,
  sum_of_other_index_sizes BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (database_name, table_name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
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