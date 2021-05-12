[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>innodb_buffer_stats_by_table


# ![logo](../../../../../Images/view64.svg) innodb_buffer_stats_by_table


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
|object_schema|TEXT||False|False|False|False|
|object_name|TEXT||False|False|False|False|
|allocated|VARCHAR|11|False|False|False|False|
|data|VARCHAR|11|False|False|False|False|
|pages|BIGINT||False|False|False|True|
|pages_hashed|BIGINT||False|False|False|True|
|pages_old|BIGINT||False|False|False|True|
|rows_cached|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW innodb_buffer_stats_by_table
AS
	SELECT
	  IF((LOCATE('.', `ibp`.`TABLE_NAME`) = 0), 'InnoDB System', REPLACE(SUBSTRING_INDEX (`ibp`.`TABLE_NAME`, '.', 1), '`', '')) AS `object_schema`,
	  REPLACE(SUBSTRING_INDEX (`ibp`.`TABLE_NAME`, '.', -(1)), '`', '') AS `object_name`,
	  format_bytes(SUM(IF((`ibp`.`COMPRESSED_SIZE` = 0), 16384, `ibp`.`COMPRESSED_SIZE`))) AS `allocated`,
	  format_bytes(SUM(`ibp`.`DATA_SIZE`)) AS `data`,
	  COUNT(`ibp`.`PAGE_NUMBER`) AS `pages`,
	  COUNT(IF((`ibp`.`IS_HASHED` = 'YES'), 1, NULL)) AS `pages_hashed`,
	  COUNT(IF((`ibp`.`IS_OLD` = 'YES'), 1, NULL)) AS `pages_old`,
	  ROUND((SUM(`ibp`.`NUMBER_RECORDS`) / COUNT(DISTINCT `ibp`.`INDEX_NAME`)), 0) AS `rows_cached`
	FROM `information_schema`.`INNODB_BUFFER_PAGE` `ibp`
	WHERE (`ibp`.`TABLE_NAME` IS NOT NULL)
	GROUP BY `object_schema`,
	         `object_name`
	ORDER BY SUM(IF((`ibp`.`COMPRESSED_SIZE` = 0), 16384, `ibp`.`COMPRESSED_SIZE`)) DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial