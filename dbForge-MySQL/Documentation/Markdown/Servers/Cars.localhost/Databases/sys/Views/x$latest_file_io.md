[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$latest_file_io


# ![logo](../../../../../Images/view64.svg) x$latest_file_io


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
|thread|VARCHAR|316|False|False|False|False|
|file|VARCHAR|512|False|False|False|False|
|latency|BIGINT||True|False|False|False|
|operation|VARCHAR|32|False|False|False|True|
|requested|BIGINT||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$latest_file_io
AS
	SELECT
	  IF((`processlist`.`ID` IS NULL), CONCAT(SUBSTRING_INDEX (`performance_schema`.`threads`.`NAME`, '/', -(1)), ':', `performance_schema`.`events_waits_history_long`.`THREAD_ID`), CONVERT(CONCAT(`processlist`.`USER`, '@', `processlist`.`HOST`, ':', `processlist`.`ID`) USING utf8mb4)) AS `thread`,
	  `performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,
	  `performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,
	  `performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,
	  `performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested`
	FROM ((`performance_schema`.`events_waits_history_long`
	  JOIN `performance_schema`.`threads`
	    ON ((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`)))
	  LEFT JOIN `information_schema`.`PROCESSLIST` `processlist`
	    ON ((`performance_schema`.`threads`.`PROCESSLIST_ID` = `processlist`.`ID`)))
	WHERE ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` IS NOT NULL)
	AND (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` LIKE 'wait/io/file/%'))
	ORDER BY `performance_schema`.`events_waits_history_long`.`TIMER_START`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial