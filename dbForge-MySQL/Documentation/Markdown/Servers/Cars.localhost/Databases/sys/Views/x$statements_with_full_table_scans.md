[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$statements_with_full_table_scans


# ![logo](../../../../../Images/view64.svg) x$statements_with_full_table_scans


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
|total_latency|BIGINT||True|False|False|True|
|no_index_used_count|BIGINT||True|False|False|True|
|no_good_index_used_count|BIGINT||True|False|False|True|
|no_index_used_pct|DECIMAL||False|False|False|True|
|rows_sent|BIGINT||True|False|False|True|
|rows_examined|BIGINT||True|False|False|True|
|rows_sent_avg|DECIMAL||False|False|False|False|
|rows_examined_avg|DECIMAL||False|False|False|False|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|
|digest|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$statements_with_full_table_scans
AS
	SELECT
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
	  `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,
	  ROUND((IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0) * 100), 0) AS `no_index_used_pct`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
	  ROUND((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`), 0) AS `rows_sent_avg`,
	  ROUND((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`), 0) AS `rows_examined_avg`,
	  `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	WHERE (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)
	OR (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0))
	AND (NOT ((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` LIKE 'SHOW%'))))
	ORDER BY ROUND((IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0) * 100), 0) DESC, `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial