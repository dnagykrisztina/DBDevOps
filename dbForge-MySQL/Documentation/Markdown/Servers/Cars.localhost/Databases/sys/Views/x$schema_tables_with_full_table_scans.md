[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$schema_tables_with_full_table_scans


# ![logo](../../../../../Images/view64.svg) x$schema_tables_with_full_table_scans


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
|rows_full_scanned|BIGINT||True|False|False|True|
|latency|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$schema_tables_with_full_table_scans
AS
	SELECT
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency`
	FROM `performance_schema`.`table_io_waits_summary_by_index_usage`
	WHERE ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` IS NULL)
	AND (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0))
	ORDER BY `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial