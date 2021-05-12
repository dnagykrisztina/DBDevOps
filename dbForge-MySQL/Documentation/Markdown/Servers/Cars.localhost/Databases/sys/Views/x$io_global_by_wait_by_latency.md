[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$io_global_by_wait_by_latency


# ![logo](../../../../../Images/view64.svg) x$io_global_by_wait_by_latency


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
|event_name|VARCHAR|128|False|False|False|False|
|total|BIGINT||True|False|False|True|
|total_latency|BIGINT||True|False|False|True|
|avg_latency|BIGINT||True|False|False|True|
|max_latency|BIGINT||True|False|False|True|
|read_latency|BIGINT||True|False|False|True|
|write_latency|BIGINT||True|False|False|True|
|misc_latency|BIGINT||True|False|False|True|
|count_read|BIGINT||True|False|False|True|
|total_read|BIGINT||False|False|False|True|
|avg_read|DECIMAL||False|False|False|True|
|count_write|BIGINT||True|False|False|True|
|total_written|BIGINT||False|False|False|True|
|avg_written|DECIMAL||False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$io_global_by_wait_by_latency
AS
	SELECT
	  SUBSTRING_INDEX (`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`, '/', -(2)) AS `event_name`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,
	  IFNULL((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / NULLIF(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`, 0)), 0) AS `avg_read`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
	  `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,
	  IFNULL((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / NULLIF(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`, 0)), 0) AS `avg_written`
	FROM `performance_schema`.`file_summary_by_event_name`
	WHERE ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` LIKE 'wait/io/file/%')
	AND (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0))
	ORDER BY `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial