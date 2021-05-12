[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>statements_with_errors_or_warnings


# ![logo](../../../../../Images/view64.svg) statements_with_errors_or_warnings


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
|errors|BIGINT||True|False|False|True|
|error_pct|DECIMAL||False|False|False|True|
|warnings|BIGINT||True|False|False|True|
|warning_pct|DECIMAL||False|False|False|True|
|first_seen|TIMESTAMP|0|False|False|False|True|
|last_seen|TIMESTAMP|0|False|False|False|True|
|digest|VARCHAR|64|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW statements_with_errors_or_warnings
AS
	SELECT
	  `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
	  `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,
	  (IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0) * 100) AS `error_pct`,
	  `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,
	  (IFNULL((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / NULLIF(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`, 0)), 0) * 100) AS `warning_pct`,
	  `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
	  `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	WHERE ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0)
	OR (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0))
	ORDER BY `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` DESC, `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_statement](../Functions/format_statement.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial