[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$host_summary_by_file_io_type


# ![logo](../../../../../Images/view64.svg) x$host_summary_by_file_io_type


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
|host|VARCHAR|255|False|False|False|False|
|event_name|VARCHAR|128|False|False|False|True|
|total|BIGINT||True|False|False|True|
|total_latency|BIGINT||True|False|False|True|
|max_latency|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$host_summary_by_file_io_type
AS
	SELECT
	  IF((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` IS NULL), 'background', `performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,
	  `performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,
	  `performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
	  `performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
	FROM `performance_schema`.`events_waits_summary_by_host_by_event_name`
	WHERE ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` LIKE 'wait/io/file%')
	AND (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0))
	ORDER BY IF((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` IS NULL), 'background', `performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`), `performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial