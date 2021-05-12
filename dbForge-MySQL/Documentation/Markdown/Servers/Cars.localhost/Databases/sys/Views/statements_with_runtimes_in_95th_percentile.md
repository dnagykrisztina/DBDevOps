[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>statements_with_runtimes_in_95th_percentile


# ![logo](../../../../../Images/view64.svg) statements_with_runtimes_in_95th_percentile


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
|total_latency|VARCHAR|11|False|False|False|False|
|max_latency|VARCHAR|11|False|False|False|False|
|avg_latency|VARCHAR|11|False|False|False|False|
|rows_sent|BIGINT||True|False|False|True|
|rows_sent_avg|DECIMAL||False|False|False|True|
|rows_examined|BIGINT||True|False|False|True|
|rows_examined_avg|DECIMAL||False|False|False|True|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|
|digest|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW statements_with_runtimes_in_95th_percentile
AS
	SELECT
	  `sys`.`format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,
	  `stmts`.`SCHEMA_NAME` AS `db`,
	  IF(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) OR (`stmts`.`SUM_NO_INDEX_USED` > 0)), '*', '') AS `full_scan`,
	  `stmts`.`COUNT_STAR` AS `exec_count`,
	  `stmts`.`SUM_ERRORS` AS `err_count`,
	  `stmts`.`SUM_WARNINGS` AS `warn_count`,
	  format_pico_time(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,
	  format_pico_time(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,
	  format_pico_time(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,
	  `stmts`.`SUM_ROWS_SENT` AS `rows_sent`,
	  ROUND(IFNULL((`stmts`.`SUM_ROWS_SENT` / NULLIF(`stmts`.`COUNT_STAR`, 0)), 0), 0) AS `rows_sent_avg`,
	  `stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
	  ROUND(IFNULL((`stmts`.`SUM_ROWS_EXAMINED` / NULLIF(`stmts`.`COUNT_STAR`, 0)), 0), 0) AS `rows_examined_avg`,
	  `stmts`.`FIRST_SEEN` AS `first_seen`,
	  `stmts`.`LAST_SEEN` AS `last_seen`,
	  `stmts`.`DIGEST` AS `digest`
	FROM (`performance_schema`.`events_statements_summary_by_digest` `stmts`
	  JOIN `x$ps_digest_95th_percentile_by_avg_us` `top_percentile`
	    ON ((ROUND((`stmts`.`AVG_TIMER_WAIT` / 1000000), 0) >= `top_percentile`.`avg_us`)))
	ORDER BY `stmts`.`AVG_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Function](../../../../../Images/function.svg) [format_statement](../Functions/format_statement.md)
- ![View](../../../../../Images/view.svg) [x$ps_digest_95th_percentile_by_avg_us](x$ps_digest_95th_percentile_by_avg_us.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial