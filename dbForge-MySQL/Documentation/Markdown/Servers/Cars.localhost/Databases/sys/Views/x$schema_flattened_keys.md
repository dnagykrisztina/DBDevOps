[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$schema_flattened_keys


# ![logo](../../../../../Images/view64.svg) x$schema_flattened_keys


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|With Check Option|NONE|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|ANSI Quotes|False|


## <a name="#Columns"></a>Columns
|Name|Data Type|Length|Unsigned|Zerofill|Binary|Not Null|
|---|---|---|---|---|---|---|
|table_schema|VARCHAR|64|False|False|True|True|
|table_name|VARCHAR|64|False|False|True|True|
|index_name|VARCHAR|64|False|False|False|False|
|non_unique|INT||False|False|False|False|
|subpart_exists|BIGINT||False|False|False|False|
|index_columns|TEXT||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$schema_flattened_keys
AS
	SELECT
	  `information_schema`.`STATISTICS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,
	  `information_schema`.`STATISTICS`.`TABLE_NAME` AS `TABLE_NAME`,
	  `information_schema`.`STATISTICS`.`INDEX_NAME` AS `INDEX_NAME`,
	  MAX(`information_schema`.`STATISTICS`.`NON_UNIQUE`) AS `non_unique`,
	  MAX(IF((`information_schema`.`STATISTICS`.`SUB_PART` IS NULL), 0, 1)) AS `subpart_exists`,
	  GROUP_CONCAT(`information_schema`.`STATISTICS`.`COLUMN_NAME` ORDER BY `information_schema`.`STATISTICS`.`SEQ_IN_INDEX` ASC SEPARATOR ',') AS `index_columns`
	FROM `information_schema`.`STATISTICS`
	WHERE ((`information_schema`.`STATISTICS`.`INDEX_TYPE` = 'BTREE')
	AND (`information_schema`.`STATISTICS`.`TABLE_SCHEMA` NOT IN ('mysql', 'sys', 'INFORMATION_SCHEMA', 'PERFORMANCE_SCHEMA')))
	GROUP BY `information_schema`.`STATISTICS`.`TABLE_SCHEMA`,
	         `information_schema`.`STATISTICS`.`TABLE_NAME`,
	         `information_schema`.`STATISTICS`.`INDEX_NAME`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`1`_
- ![View](../../../../../Images/view.svg) [schema_redundant_indexes](schema_redundant_indexes.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial