[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>schema_auto_increment_columns


# ![logo](../../../../../Images/view64.svg) schema_auto_increment_columns


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
|column_name|VARCHAR|64|False|False|False|False|
|data_type|LONGTEXT||False|False|True|False|
|column_type|MEDIUMTEXT||False|False|True|True|
|is_signed|INT||False|False|False|True|
|is_unsigned|INT||False|False|False|True|
|max_value|BIGINT||True|False|False|False|
|auto_increment|BIGINT||True|False|False|False|
|auto_increment_ratio|DECIMAL||True|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW schema_auto_increment_columns
AS
	SELECT
	  `information_schema`.`COLUMNS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,
	  `information_schema`.`COLUMNS`.`TABLE_NAME` AS `TABLE_NAME`,
	  `information_schema`.`COLUMNS`.`COLUMN_NAME` AS `COLUMN_NAME`,
	  `information_schema`.`COLUMNS`.`DATA_TYPE` AS `DATA_TYPE`,
	  `information_schema`.`COLUMNS`.`COLUMN_TYPE` AS `COLUMN_TYPE`,
	  (LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) = 0) AS `is_signed`,
	  (LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,
	  ((CASE `information_schema`.`COLUMNS`.`DATA_TYPE` WHEN 'tinyint' THEN 255 WHEN 'smallint' THEN 65535 WHEN 'mediumint' THEN 16777215 WHEN 'int' THEN 4294967295 WHEN 'bigint' THEN 18446744073709551615 END) >> IF((LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0), 0, 1)) AS `max_value`,
	  `information_schema`.`TABLES`.`AUTO_INCREMENT` AS `AUTO_INCREMENT`,
	  (`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((CASE `information_schema`.`COLUMNS`.`DATA_TYPE` WHEN 'tinyint' THEN 255 WHEN 'smallint' THEN 65535 WHEN 'mediumint' THEN 16777215 WHEN 'int' THEN 4294967295 WHEN 'bigint' THEN 18446744073709551615 END) >> IF((LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0), 0, 1))) AS `auto_increment_ratio`
	FROM (`information_schema`.`COLUMNS`
	  JOIN `information_schema`.`TABLES`
	    ON (((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` = `information_schema`.`TABLES`.`TABLE_SCHEMA`)
	    AND (`information_schema`.`COLUMNS`.`TABLE_NAME` = `information_schema`.`TABLES`.`TABLE_NAME`))))
	WHERE ((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` NOT IN ('mysql', 'sys', 'INFORMATION_SCHEMA', 'performance_schema'))
	AND (`information_schema`.`TABLES`.`TABLE_TYPE` = 'BASE TABLE')
	AND (`information_schema`.`COLUMNS`.`EXTRA` = 'auto_increment'))
	ORDER BY (`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((CASE `information_schema`.`COLUMNS`.`DATA_TYPE` WHEN 'tinyint' THEN 255 WHEN 'smallint' THEN 65535 WHEN 'mediumint' THEN 16777215 WHEN 'int' THEN 4294967295 WHEN 'bigint' THEN 18446744073709551615 END) >> IF((LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0), 0, 1))) DESC, ((CASE `information_schema`.`COLUMNS`.`DATA_TYPE` WHEN 'tinyint' THEN 255 WHEN 'smallint' THEN 65535 WHEN 'mediumint' THEN 16777215 WHEN 'int' THEN 4294967295 WHEN 'bigint' THEN 18446744073709551615 END) >> IF((LOCATE('unsigned', `information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0), 0, 1));
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial