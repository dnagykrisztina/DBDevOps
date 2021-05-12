[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>schema_redundant_indexes


# ![logo](../../../../../Images/view64.svg) schema_redundant_indexes


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
|redundant_index_name|VARCHAR|64|False|False|False|False|
|redundant_index_columns|TEXT||False|False|False|False|
|redundant_index_non_unique|INT||False|False|False|False|
|dominant_index_name|VARCHAR|64|False|False|False|False|
|dominant_index_columns|TEXT||False|False|False|False|
|dominant_index_non_unique|INT||False|False|False|False|
|subpart_exists|INT||False|False|False|True|
|sql_drop_index|VARCHAR|223|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW schema_redundant_indexes
AS
	SELECT
	  `redundant_keys`.`table_schema` AS `table_schema`,
	  `redundant_keys`.`table_name` AS `table_name`,
	  `redundant_keys`.`index_name` AS `redundant_index_name`,
	  `redundant_keys`.`index_columns` AS `redundant_index_columns`,
	  `redundant_keys`.`non_unique` AS `redundant_index_non_unique`,
	  `dominant_keys`.`index_name` AS `dominant_index_name`,
	  `dominant_keys`.`index_columns` AS `dominant_index_columns`,
	  `dominant_keys`.`non_unique` AS `dominant_index_non_unique`,
	  IF(((0 <> `redundant_keys`.`subpart_exists`) OR (0 <> `dominant_keys`.`subpart_exists`)), 1, 0) AS `subpart_exists`,
	  CONCAT('ALTER TABLE `', `redundant_keys`.`table_schema`, '`.`', `redundant_keys`.`table_name`, '` DROP INDEX `', `redundant_keys`.`index_name`, '`') AS `sql_drop_index`
	FROM (`x$schema_flattened_keys` `redundant_keys`
	  JOIN `x$schema_flattened_keys` `dominant_keys`
	    ON (((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`)
	    AND (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`))))
	WHERE ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`)
	AND (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`)
	AND ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`)
	OR ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`)
	AND (IF((`redundant_keys`.`index_name` = 'PRIMARY'), '', `redundant_keys`.`index_name`) > IF((`dominant_keys`.`index_name` = 'PRIMARY'), '', `dominant_keys`.`index_name`)))))
	OR ((LOCATE(CONCAT(`redundant_keys`.`index_columns`, ','), `dominant_keys`.`index_columns`) = 1)
	AND (`redundant_keys`.`non_unique` = 1))
	OR ((LOCATE(CONCAT(`dominant_keys`.`index_columns`, ','), `redundant_keys`.`index_columns`) = 1)
	AND (`dominant_keys`.`non_unique` = 0))));
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![View](../../../../../Images/view.svg) [x$schema_flattened_keys](x$schema_flattened_keys.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial