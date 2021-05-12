[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>statements_with_sorting


# ![logo](../../../../../Images/view64.svg) statements_with_sorting


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
|exec_count|BIGINT||True|False|False|True|
|total_latency|VARCHAR|11|False|False|False|False|
|sort_merge_passes|BIGINT||True|False|False|True|
|avg_sort_merges|DECIMAL||False|False|False|True|
|sorts_using_scans|BIGINT||True|False|False|True|
|sort_using_range|BIGINT||True|False|False|True|
|rows_sorted|BIGINT||True|False|False|True|
|avg_rows_sorted|DECIMAL||False|False|False|True|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|
|digest|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW statements_with_sorting
AS
	SELECT
	  `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
	  `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
	  format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `avg_sort_merges`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `avg_rows_sorted`,
	  `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	WHERE (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0)
	ORDER BY `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_statement](../Functions/format_statement.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial