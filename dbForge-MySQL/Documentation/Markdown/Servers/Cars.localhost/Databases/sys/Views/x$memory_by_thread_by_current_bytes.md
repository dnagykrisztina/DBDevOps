[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$memory_by_thread_by_current_bytes


# ![logo](../../../../../Images/view64.svg) x$memory_by_thread_by_current_bytes


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
|thread_id|BIGINT||True|False|False|True|
|user|VARCHAR|288|False|False|False|False|
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
VIEW x$memory_by_thread_by_current_bytes
AS
	SELECT
	  `t`.`THREAD_ID` AS `thread_id`,
	  IF((`t`.`NAME` = 'thread/sql/one_connection'), CONCAT(`t`.`PROCESSLIST_USER`, '@', CONVERT(`t`.`PROCESSLIST_HOST` USING utf8mb4)), REPLACE(`t`.`NAME`, 'thread/', '')) AS `user`,
	  SUM(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,
	  SUM(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,
	  IFNULL((SUM(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / NULLIF(SUM(`mt`.`CURRENT_COUNT_USED`), 0)), 0) AS `current_avg_alloc`,
	  MAX(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,
	  SUM(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated`
	FROM (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt`
	  JOIN `performance_schema`.`threads` `t`
	    ON ((`mt`.`THREAD_ID` = `t`.`THREAD_ID`)))
	GROUP BY `t`.`THREAD_ID`,
	         IF((`t`.`NAME` = 'thread/sql/one_connection'), CONCAT(`t`.`PROCESSLIST_USER`, '@', CONVERT(`t`.`PROCESSLIST_HOST` USING utf8mb4)), REPLACE(`t`.`NAME`, 'thread/', ''))
	ORDER BY SUM(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) DESC;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![View](../../../../../Images/view.svg) [processlist](processlist.md)
- ![View](../../../../../Images/view.svg) [x$processlist](x$processlist.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial