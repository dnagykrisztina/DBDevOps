[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$session


# ![logo](../../../../../Images/view64.svg) x$session


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
|thd_id|BIGINT||True|False|False|True|
|conn_id|BIGINT||True|False|False|False|
|user|VARCHAR|288|False|False|False|False|
|db|VARCHAR|64|False|False|False|False|
|command|VARCHAR|16|False|False|False|False|
|state|VARCHAR|64|False|False|False|False|
|time|BIGINT||False|False|False|False|
|current_statement|LONGTEXT||False|False|False|False|
|statement_latency|BIGINT||True|False|False|False|
|progress|DECIMAL||False|False|False|False|
|lock_latency|BIGINT||True|False|False|False|
|rows_examined|BIGINT||True|False|False|False|
|rows_sent|BIGINT||True|False|False|False|
|rows_affected|BIGINT||True|False|False|False|
|tmp_tables|BIGINT||True|False|False|False|
|tmp_disk_tables|BIGINT||True|False|False|False|
|full_scan|VARCHAR|3|False|False|False|True|
|last_statement|LONGTEXT||False|False|False|False|
|last_statement_latency|BIGINT||True|False|False|False|
|current_memory|DECIMAL||False|False|False|False|
|last_wait|VARCHAR|128|False|False|False|False|
|last_wait_latency|VARCHAR|20|False|False|False|False|
|source|VARCHAR|64|False|False|False|False|
|trx_latency|BIGINT||True|False|False|False|
|trx_state|ENUM|0|False|False|False|False|
|trx_autocommit|ENUM|0|False|False|False|False|
|pid|VARCHAR|1024|False|False|True|False|
|program_name|VARCHAR|1024|False|False|True|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$session
AS
	SELECT
	  `x$processlist`.`thd_id` AS `thd_id`,
	  `x$processlist`.`conn_id` AS `conn_id`,
	  `x$processlist`.`user` AS `user`,
	  `x$processlist`.`db` AS `db`,
	  `x$processlist`.`command` AS `command`,
	  `x$processlist`.`state` AS `state`,
	  `x$processlist`.`time` AS `time`,
	  `x$processlist`.`current_statement` AS `current_statement`,
	  `x$processlist`.`statement_latency` AS `statement_latency`,
	  `x$processlist`.`progress` AS `progress`,
	  `x$processlist`.`lock_latency` AS `lock_latency`,
	  `x$processlist`.`rows_examined` AS `rows_examined`,
	  `x$processlist`.`rows_sent` AS `rows_sent`,
	  `x$processlist`.`rows_affected` AS `rows_affected`,
	  `x$processlist`.`tmp_tables` AS `tmp_tables`,
	  `x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,
	  `x$processlist`.`full_scan` AS `full_scan`,
	  `x$processlist`.`last_statement` AS `last_statement`,
	  `x$processlist`.`last_statement_latency` AS `last_statement_latency`,
	  `x$processlist`.`current_memory` AS `current_memory`,
	  `x$processlist`.`last_wait` AS `last_wait`,
	  `x$processlist`.`last_wait_latency` AS `last_wait_latency`,
	  `x$processlist`.`source` AS `source`,
	  `x$processlist`.`trx_latency` AS `trx_latency`,
	  `x$processlist`.`trx_state` AS `trx_state`,
	  `x$processlist`.`trx_autocommit` AS `trx_autocommit`,
	  `x$processlist`.`pid` AS `pid`,
	  `x$processlist`.`program_name` AS `program_name`
	FROM `x$processlist`
	WHERE ((`x$processlist`.`conn_id` IS NOT NULL)
	AND (`x$processlist`.`command` <> 'Daemon'));
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![View](../../../../../Images/view.svg) [x$processlist](x$processlist.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial