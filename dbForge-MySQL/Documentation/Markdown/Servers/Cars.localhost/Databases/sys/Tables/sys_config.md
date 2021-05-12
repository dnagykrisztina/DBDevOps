[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Tables](Tables.md)>sys_config


# ![logo](../../../../../Images/table64.svg) sys_config

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_0900_ai_ci|
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
|Created|2021. 04. 10. 15:36:58|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|variable|VARCHAR|128|||False|False|False|True|False||False||
||value|VARCHAR|128|||False|False|False|False|False|NULL|False||
||set_time|TIMESTAMP|0|||False|False|False|False|False|CURRENT_TIMESTAMP|False||
||set_by|VARCHAR|128|||False|False|False|False|False|NULL|False||

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|sys_config_insert_set_user|BEFORE|INSERT|Definer|mysql.sys@'localhost'|
|sys_config_update_set_user|BEFORE|UPDATE|Definer|mysql.sys@'localhost'|

## <a name="#Permissions"></a>Permissions
|Action|Owner|
|---|---|
|SELECT|mysql.sys@localhost|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE sys_config (
  variable VARCHAR(128) NOT NULL,
  value VARCHAR(128) DEFAULT NULL,
  set_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  set_by VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (variable)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`3`_
- ![Trigger](../../../../../Images/trigger.svg) [sys_config_insert_set_user](../Triggers/sys_config_insert_set_user.md)
- ![Trigger](../../../../../Images/trigger.svg) [sys_config_update_set_user](../Triggers/sys_config_update_set_user.md)
- ![Function](../../../../../Images/function.svg) [sys_get_config](../Functions/sys_get_config.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial