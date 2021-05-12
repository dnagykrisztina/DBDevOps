[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$io_by_thread_by_latency


# ![logo](../../../../../Images/view64.svg) x$io_by_thread_by_latency


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
|user|VARCHAR|288|False|False|False|False|
|total|DECIMAL||False|False|False|False|
|total_latency|DECIMAL||False|False|False|False|
|min_latency|BIGINT||True|False|False|False|
|avg_latency|DECIMAL||False|False|False|False|
|max_latency|BIGINT||True|False|False|False|
|thread_id|BIGINT||True|False|False|True|
|processlist_id|BIGINT||True|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$io_by_thread_by_latency
AS
	SELECT
	  IF((`performance_schema`.`threads`.`PROCESSLIST_ID` IS NULL), SUBSTRING_INDEX (`performance_schema`.`threads`.`NAME`, '/', -(1)), CONCAT(`performance_schema`.`threads`.`PROCESSLIST_USER`, '@', CONVERT(`performance_schema`.`threads`.`PROCESSLIST_HOST` USING utf8mb4))) AS `user`,
	  SUM(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,
	  SUM(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  MIN(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,
	  AVG(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
	  MAX(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
	  `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,
	  `performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id`
	FROM (`performance_schema`.`events_waits_summary_by_thread_by_event_name`
	  LEFT JOIN `performance_schema`.`threads`
	    ON ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`)))
	WHERE ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` LIKE 'wait/io/file/%')
	AND (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0))
	GROUP BY `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,
	         `performance_schema`.`threads`.`PROCESSLIST_ID`,
	         `user`
	ORDER BY SUM(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial