[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>user_summary_by_stages


# ![logo](../../../../../Images/view64.svg) user_summary_by_stages


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
|event_name|VARCHAR|128|False|False|False|True|
|total|BIGINT||True|False|False|True|
|total_latency|VARCHAR|11|False|False|False|False|
|avg_latency|VARCHAR|11|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW user_summary_by_stages
AS
	SELECT
	  IF((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,
	  `performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,
	  `performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
	  format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`
	FROM `performance_schema`.`events_stages_summary_by_user_by_event_name`
	WHERE (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0)
	ORDER BY IF((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`), `performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial