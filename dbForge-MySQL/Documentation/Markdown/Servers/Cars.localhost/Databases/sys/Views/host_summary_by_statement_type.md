[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>host_summary_by_statement_type


# ![logo](../../../../../Images/view64.svg) host_summary_by_statement_type


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
|statement|VARCHAR|128|False|False|False|False|
|total|BIGINT||True|False|False|True|
|total_latency|VARCHAR|11|False|False|False|False|
|max_latency|VARCHAR|11|False|False|False|False|
|lock_latency|VARCHAR|11|False|False|False|False|
|rows_sent|BIGINT||True|False|False|True|
|rows_examined|BIGINT||True|False|False|True|
|rows_affected|BIGINT||True|False|False|True|
|full_scans|BIGINT||True|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW host_summary_by_statement_type
AS
	SELECT
	  IF((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` IS NULL), 'background', `performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,
	  SUBSTRING_INDEX (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`, '/', -(1)) AS `statement`,
	  `performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
	  format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
	  format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,
	  `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,
	  `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
	  `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,
	  (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans`
	FROM `performance_schema`.`events_statements_summary_by_host_by_event_name`
	WHERE (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0)
	ORDER BY IF((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` IS NULL), 'background', `performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`), `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial