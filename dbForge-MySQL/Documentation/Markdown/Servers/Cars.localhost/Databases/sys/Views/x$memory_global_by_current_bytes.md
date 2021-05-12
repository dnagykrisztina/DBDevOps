[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$memory_global_by_current_bytes


# ![logo](../../../../../Images/view64.svg) x$memory_global_by_current_bytes


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
|current_alloc|BIGINT||False|False|False|True|
|current_avg_alloc|DECIMAL||False|False|False|True|
|high_count|BIGINT||False|False|False|True|
|high_alloc|BIGINT||False|False|False|True|
|high_avg_alloc|DECIMAL||False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$memory_global_by_current_bytes
AS
	SELECT
	  `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,
	  IFNULL((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / NULLIF(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`, 0)), 0) AS `current_avg_alloc`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,
	  `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,
	  IFNULL((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / NULLIF(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`, 0)), 0) AS `high_avg_alloc`
	FROM `performance_schema`.`memory_summary_global_by_event_name`
	WHERE (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0)
	ORDER BY `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial