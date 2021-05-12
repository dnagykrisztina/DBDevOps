[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>memory_global_by_current_bytes


# ![logo](../../../../../Images/view64.svg) memory_global_by_current_bytes


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
|event_name|VARCHAR|128|False|False|False|True|
|current_count|BIGINT||False|False|False|True|
|current_alloc|VARCHAR|11|False|False|False|False|
|current_avg_alloc|VARCHAR|11|False|False|False|False|
|high_count|BIGINT||False|False|False|True|
|high_alloc|VARCHAR|11|False|False|False|False|
|high_avg_alloc|VARCHAR|11|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW memory_global_by_current_bytes
AS
	SELECT
	  `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,
	  format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,
	  format_bytes(IFNULL((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / NULLIF(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`, 0)), 0)) AS `current_avg_alloc`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,
	  format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,
	  format_bytes(IFNULL((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / NULLIF(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`, 0)), 0)) AS `high_avg_alloc`
	FROM `performance_schema`.`memory_summary_global_by_event_name`
	WHERE (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0)
	ORDER BY `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial