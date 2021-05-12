[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>engine_cost


# ![logo](../../../../../Images/table64.svg) engine_cost

## <a name="#Description"></a>Description
> 
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
|Created|2021. 04. 10. 15:36:57|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|engine_name|VARCHAR|64|||False|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|device_type|INT||11||False|False|False|True|False||False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|cost_name|VARCHAR|64|||False|False|False|True|False||False||
||cost_value|FLOAT|0|||False|False|False|False|False|NULL|False||
||last_update|TIMESTAMP|0|||False|False|False|True|False|CURRENT_TIMESTAMP|False||
||comment|VARCHAR|1024|||False|False|False|False|False|NULL|False||
||default_value|FLOAT|0|||False|False|False|False|False||True||

## <a name="#VirtualColumns"></a>Virtual Columns
|Name|Definition|Storage Type|
|---|---|---|
|default_value|(case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)|VIRTUAL|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE engine_cost (
  engine_name VARCHAR(64) NOT NULL,
  device_type INT NOT NULL,
  cost_name VARCHAR(64) NOT NULL,
  cost_value FLOAT DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  comment VARCHAR(1024) DEFAULT NULL,
  default_value FLOAT GENERATED ALWAYS AS (case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end) VIRTUAL,
  PRIMARY KEY (cost_name, engine_name, device_type)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
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