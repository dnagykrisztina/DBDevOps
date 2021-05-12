[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$schema_index_statistics


# ![logo](../../../../../Images/view64.svg) x$schema_index_statistics


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
|table_schema|VARCHAR|64|False|False|False|False|
|table_name|VARCHAR|64|False|False|False|False|
|index_name|VARCHAR|64|False|False|False|False|
|rows_selected|BIGINT||True|False|False|True|
|select_latency|BIGINT||True|False|False|True|
|rows_inserted|BIGINT||True|False|False|True|
|insert_latency|BIGINT||True|False|False|True|
|rows_updated|BIGINT||True|False|False|True|
|update_latency|BIGINT||True|False|False|True|
|rows_deleted|BIGINT||True|False|False|True|
|delete_latency|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$schema_index_statistics
AS
	SELECT
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,
	  `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE` AS `delete_latency`
	FROM `performance_schema`.`table_io_waits_summary_by_index_usage`
	WHERE (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` IS NOT NULL)
	ORDER BY `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial