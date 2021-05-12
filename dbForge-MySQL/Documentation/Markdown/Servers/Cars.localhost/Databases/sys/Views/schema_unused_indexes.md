[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>schema_unused_indexes


# ![logo](../../../../../Images/view64.svg) schema_unused_indexes


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
|object_schema|VARCHAR|64|False|False|False|False|
|object_name|VARCHAR|64|False|False|False|False|
|index_name|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW schema_unused_indexes
AS
	SELECT
	  `t`.`OBJECT_SCHEMA` AS `object_schema`,
	  `t`.`OBJECT_NAME` AS `object_name`,
	  `t`.`INDEX_NAME` AS `index_name`
	FROM (`performance_schema`.`table_io_waits_summary_by_index_usage` `t`
	  JOIN `information_schema`.`STATISTICS` `s`
	    ON (((`t`.`OBJECT_SCHEMA` = CONVERT(`information_schema`.`s`.`TABLE_SCHEMA` USING utf8mb4))
	    AND (`t`.`OBJECT_NAME` = CONVERT(`information_schema`.`s`.`TABLE_NAME` USING utf8mb4))
	    AND (CONVERT(`t`.`INDEX_NAME` USING utf8) = `information_schema`.`s`.`INDEX_NAME`))))
	WHERE ((`t`.`INDEX_NAME` IS NOT NULL)
	AND (`t`.`COUNT_STAR` = 0)
	AND (`t`.`OBJECT_SCHEMA` <> 'mysql')
	AND (`t`.`INDEX_NAME` <> 'PRIMARY')
	AND (`information_schema`.`s`.`NON_UNIQUE` = 1)
	AND (`information_schema`.`s`.`SEQ_IN_INDEX` = 1))
	ORDER BY `t`.`OBJECT_SCHEMA`, `t`.`OBJECT_NAME`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial