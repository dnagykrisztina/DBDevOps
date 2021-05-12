[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$user_summary_by_file_io


# ![logo](../../../../../Images/view64.svg) x$user_summary_by_file_io


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
|user|VARCHAR|32|False|False|True|False|
|ios|DECIMAL||False|False|False|False|
|io_latency|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$user_summary_by_file_io
AS
	SELECT
	  IF((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,
	  SUM(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,
	  SUM(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency`
	FROM `performance_schema`.`events_waits_summary_by_user_by_event_name`
	WHERE (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` LIKE 'wait/io/file/%')
	GROUP BY IF((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`)
	ORDER BY SUM(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![View](../../../../../Images/view.svg) [user_summary](user_summary.md)
- ![View](../../../../../Images/view.svg) [x$user_summary](x$user_summary.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial