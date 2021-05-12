[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$statement_analysis


# ![logo](../../../../../Images/view64.svg) x$statement_analysis


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
|query|LONGTEXT||False|False|False|False|
|db|VARCHAR|64|False|False|False|False|
|full_scan|VARCHAR|1|False|False|False|True|
|exec_count|BIGINT||True|False|False|True|
|err_count|BIGINT||True|False|False|True|
|warn_count|BIGINT||True|False|False|True|
|total_latency|BIGINT||True|False|False|True|
|max_latency|BIGINT||True|False|False|True|
|avg_latency|BIGINT||True|False|False|True|
|lock_latency|BIGINT||True|False|False|True|
|rows_sent|BIGINT||True|False|False|True|
|rows_sent_avg|DECIMAL||False|False|False|True|
|rows_examined|BIGINT||True|False|False|True|
|rows_examined_avg|DECIMAL||False|False|False|True|
|rows_affected|BIGINT||True|False|False|True|
|rows_affected_avg|DECIMAL||False|False|False|True|
|tmp_tables|BIGINT||True|False|False|True|
|tmp_disk_tables|BIGINT||True|False|False|True|
|rows_sorted|BIGINT||True|False|False|True|
|sort_merge_passes|BIGINT||True|False|False|True|
|digest|VARCHAR|64|False|False|False|False|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$statement_analysis
AS
	SELECT
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
	  IF(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) OR (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)), '*', '') AS `full_scan`,
	  `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `rows_sent_avg`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `rows_examined_avg`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `rows_affected_avg`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,
	  `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	ORDER BY `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial