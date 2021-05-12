[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>ps_check_lost_instrumentation


# ![logo](../../../../../Images/view64.svg) ps_check_lost_instrumentation


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
|variable_name|VARCHAR|64|False|False|False|True|
|variable_value|VARCHAR|1024|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW ps_check_lost_instrumentation
AS
	SELECT
	  `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,
	  `performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value`
	FROM `performance_schema`.`global_status`
	WHERE ((`performance_schema`.`global_status`.`VARIABLE_NAME` LIKE 'perf%lost')
	AND (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0));
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial