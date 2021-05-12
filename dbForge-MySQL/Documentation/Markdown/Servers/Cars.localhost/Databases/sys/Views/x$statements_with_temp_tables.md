[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$statements_with_temp_tables


# ![logo](../../../../../Images/view64.svg) x$statements_with_temp_tables


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
|memory_tmp_tables|BIGINT||True|False|False|True|
|disk_tmp_tables|BIGINT||True|False|False|True|
|avg_tmp_tables_per_query|DECIMAL||False|False|False|True|
|tmp_tables_to_disk_pct|DECIMAL||False|False|False|True|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|
|digest|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$statements_with_temp_tables
AS
	SELECT
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
	  `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,
	  ROUND(IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0), 0) AS `avg_tmp_tables_per_query`,
	  ROUND((IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`, 0)), 0) * 100), 0) AS `tmp_tables_to_disk_pct`,
	  `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	WHERE (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0)
	ORDER BY `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` DESC, `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial