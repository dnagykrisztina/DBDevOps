[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>io_global_by_wait_by_bytes


# ![logo](../../../../../Images/view64.svg) io_global_by_wait_by_bytes


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
|total_latency|VARCHAR|11|False|False|False|False|
|min_latency|VARCHAR|11|False|False|False|False|
|avg_latency|VARCHAR|11|False|False|False|False|
|max_latency|VARCHAR|11|False|False|False|False|
|count_read|BIGINT||True|False|False|True|
|total_read|VARCHAR|11|False|False|False|False|
|avg_read|VARCHAR|11|False|False|False|False|
|count_write|BIGINT||True|False|False|True|
|total_written|VARCHAR|11|False|False|False|False|
|avg_written|VARCHAR|11|False|False|False|False|
|total_requested|VARCHAR|11|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW io_global_by_wait_by_bytes
AS
	SELECT
	  SUBSTRING_INDEX (`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`, '/', -(2)) AS `event_name`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
	  format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,
	  format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
	  format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
	  format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,
	  format_bytes(IFNULL((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / NULLIF(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`, 0)), 0)) AS `avg_read`,
	  `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
	  format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,
	  format_bytes(IFNULL((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / NULLIF(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`, 0)), 0)) AS `avg_written`,
	  format_bytes((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested`
	FROM `performance_schema`.`file_summary_by_event_name`
	WHERE ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` LIKE 'wait/io/file/%')
	AND (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0))
	ORDER BY (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial