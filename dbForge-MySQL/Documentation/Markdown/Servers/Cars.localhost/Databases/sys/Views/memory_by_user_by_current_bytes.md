[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>memory_by_user_by_current_bytes


# ![logo](../../../../../Images/view64.svg) memory_by_user_by_current_bytes


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
|current_count_used|DECIMAL||False|False|False|False|
|current_allocated|VARCHAR|11|False|False|False|False|
|current_avg_alloc|VARCHAR|11|False|False|False|False|
|current_max_alloc|VARCHAR|11|False|False|False|False|
|total_allocated|VARCHAR|11|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW memory_by_user_by_current_bytes
AS
	SELECT
	  IF((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,
	  SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,
	  format_bytes(SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,
	  format_bytes(IFNULL((SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / NULLIF(SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`), 0)), 0)) AS `current_avg_alloc`,
	  format_bytes(MAX(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,
	  format_bytes(SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated`
	FROM `performance_schema`.`memory_summary_by_user_by_event_name`
	GROUP BY IF((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`memory_summary_by_user_by_event_name`.`USER`)
	ORDER BY SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial