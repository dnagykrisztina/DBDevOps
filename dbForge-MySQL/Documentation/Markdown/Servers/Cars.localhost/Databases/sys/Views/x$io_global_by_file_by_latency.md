[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$io_global_by_file_by_latency


# ![logo](../../../../../Images/view64.svg) x$io_global_by_file_by_latency


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
|file|VARCHAR|512|False|False|False|True|
|total|BIGINT||True|False|False|True|
|total_latency|BIGINT||True|False|False|True|
|count_read|BIGINT||True|False|False|True|
|read_latency|BIGINT||True|False|False|True|
|count_write|BIGINT||True|False|False|True|
|write_latency|BIGINT||True|False|False|True|
|count_misc|BIGINT||True|False|False|True|
|misc_latency|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$io_global_by_file_by_latency
AS
	SELECT
	  `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,
	  `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
	  `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
	  `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,
	  `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency`
	FROM `performance_schema`.`file_summary_by_instance`
	ORDER BY `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial