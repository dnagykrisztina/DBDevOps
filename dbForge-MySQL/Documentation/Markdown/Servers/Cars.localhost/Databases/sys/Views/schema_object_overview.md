[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>schema_object_overview


# ![logo](../../../../../Images/view64.svg) schema_object_overview


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
|db|VARCHAR|64|False|False|True|True|
|object_type|VARCHAR|19|False|False|True|False|
|count|BIGINT||False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW schema_object_overview
AS
	SELECT
	  `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,
	  `information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,
	  COUNT(0) AS `count`
	FROM `information_schema`.`ROUTINES` `routines`
	GROUP BY `information_schema`.`routines`.`ROUTINE_SCHEMA`,
	         `information_schema`.`routines`.`ROUTINE_TYPE`
	UNION
	SELECT
	  `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,
	  `information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,
	  COUNT(0) AS `COUNT(*)`
	FROM `information_schema`.`TABLES` `tables`
	GROUP BY `information_schema`.`tables`.`TABLE_SCHEMA`,
	         `information_schema`.`tables`.`TABLE_TYPE`
	UNION
	SELECT
	  `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,
	  CONCAT('INDEX (', `information_schema`.`statistics`.`INDEX_TYPE`, ')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,
	  COUNT(0) AS `COUNT(*)`
	FROM `information_schema`.`STATISTICS` `statistics`
	GROUP BY `information_schema`.`statistics`.`TABLE_SCHEMA`,
	         `information_schema`.`statistics`.`INDEX_TYPE`
	UNION
	SELECT
	  `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,
	  'TRIGGER' AS `TRIGGER`,
	  COUNT(0) AS `COUNT(*)`
	FROM `information_schema`.`TRIGGERS` `triggers`
	GROUP BY `information_schema`.`triggers`.`TRIGGER_SCHEMA`
	UNION
	SELECT
	  `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,
	  'EVENT' AS `EVENT`,
	  COUNT(0) AS `COUNT(*)`
	FROM `information_schema`.`EVENTS` `events`
	GROUP BY `information_schema`.`events`.`EVENT_SCHEMA`
	ORDER BY `db`, `object_type`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial