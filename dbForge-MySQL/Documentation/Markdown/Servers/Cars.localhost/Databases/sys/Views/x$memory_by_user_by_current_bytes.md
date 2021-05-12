[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$memory_by_user_by_current_bytes


# ![logo](../../../../../Images/view64.svg) x$memory_by_user_by_current_bytes


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
|current_allocated|DECIMAL||False|False|False|False|
|current_avg_alloc|DECIMAL||False|False|False|True|
|current_max_alloc|BIGINT||False|False|False|False|
|total_allocated|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$memory_by_user_by_current_bytes
AS
	SELECT
	  IF((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,
	  SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,
	  SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,
	  IFNULL((SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / NULLIF(SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`), 0)), 0) AS `current_avg_alloc`,
	  MAX(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,
	  SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated`
	FROM `performance_schema`.`memory_summary_by_user_by_event_name`
	GROUP BY IF((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` IS NULL), 'background', `performance_schema`.`memory_summary_by_user_by_event_name`.`USER`)
	ORDER BY SUM(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) DESC;
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