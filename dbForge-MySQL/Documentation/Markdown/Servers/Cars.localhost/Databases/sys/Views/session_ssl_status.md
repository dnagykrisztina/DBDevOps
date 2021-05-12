[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>session_ssl_status


# ![logo](../../../../../Images/view64.svg) session_ssl_status


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
|ssl_version|VARCHAR|1024|False|False|False|False|
|ssl_cipher|VARCHAR|1024|False|False|False|False|
|ssl_sessions_reused|VARCHAR|1024|False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW session_ssl_status
AS
	SELECT
	  `sslver`.`THREAD_ID` AS `thread_id`,
	  `sslver`.`VARIABLE_VALUE` AS `ssl_version`,
	  `sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,
	  `sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused`
	FROM ((`performance_schema`.`status_by_thread` `sslver`
	  LEFT JOIN `performance_schema`.`status_by_thread` `sslcip`
	    ON (((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`)
	    AND (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher'))))
	  LEFT JOIN `performance_schema`.`status_by_thread` `sslreuse`
	    ON (((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`)
	    AND (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused'))))
	WHERE (`sslver`.`VARIABLE_NAME` = 'Ssl_version');
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial