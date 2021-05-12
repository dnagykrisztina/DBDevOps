[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$waits_global_by_latency


# ![logo](../../../../../Images/view64.svg) x$waits_global_by_latency


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
|events|VARCHAR|128|False|False|False|True|
|total|BIGINT||True|False|False|True|
|total_latency|BIGINT||True|False|False|True|
|avg_latency|BIGINT||True|False|False|True|
|max_latency|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$waits_global_by_latency
AS
	SELECT
	  `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,
	  `performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,
	  `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
	  `performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
	FROM `performance_schema`.`events_waits_summary_global_by_event_name`
	WHERE ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')
	AND (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0))
	ORDER BY `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial