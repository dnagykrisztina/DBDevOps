[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$user_summary_by_statement_latency


# ![logo](../../../../../Images/view64.svg) x$user_summary_by_statement_latency


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
|total|DECIMAL||False|False|False|False|
|total_latency|DECIMAL||False|False|False|False|
|max_latency|DECIMAL||False|False|False|False|
|lock_latency|DECIMAL||False|False|False|False|
|rows_sent|DECIMAL||False|False|False|False|
|rows_examined|DECIMAL||False|False|False|False|
|rows_affected|DECIMAL||False|False|False|False|
|full_scans|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$user_summary_by_statement_latency
AS
	SELECT
	  IF((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,
	  SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,
	  (SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans`
	FROM `performance_schema`.`events_statements_summary_by_user_by_event_name`
	GROUP BY IF((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`)
	ORDER BY SUM(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) DESC;
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