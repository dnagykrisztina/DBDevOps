[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>wait_classes_global_by_avg_latency


# ![logo](../../../../../Images/view64.svg) wait_classes_global_by_avg_latency


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
|event_class|VARCHAR|128|False|False|False|False|
|total|DECIMAL||False|False|False|False|
|total_latency|VARCHAR|11|False|False|False|False|
|min_latency|VARCHAR|11|False|False|False|False|
|avg_latency|VARCHAR|11|False|False|False|False|
|max_latency|VARCHAR|11|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW wait_classes_global_by_avg_latency
AS
	SELECT
	  SUBSTRING_INDEX (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`, '/', 3) AS `event_class`,
	  SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,
	  format_pico_time(CAST(SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS UNSIGNED)) AS `total_latency`,
	  format_pico_time(MIN(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,
	  format_pico_time(IFNULL((SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / NULLIF(SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`), 0)), 0)) AS `avg_latency`,
	  format_pico_time(CAST(MAX(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS UNSIGNED)) AS `max_latency`
	FROM `performance_schema`.`events_waits_summary_global_by_event_name`
	WHERE ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)
	AND (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle'))
	GROUP BY `event_class`
	ORDER BY IFNULL((SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / NULLIF(SUM(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`), 0)), 0) DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial