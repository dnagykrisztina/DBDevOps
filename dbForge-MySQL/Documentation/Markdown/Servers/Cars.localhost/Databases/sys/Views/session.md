[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>session


# ![logo](../../../../../Images/view64.svg) session


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
|statement_latency|VARCHAR|11|False|False|False|False|
|progress|DECIMAL||False|False|False|False|
|lock_latency|VARCHAR|11|False|False|False|False|
|rows_examined|BIGINT||True|False|False|False|
|rows_sent|BIGINT||True|False|False|False|
|rows_affected|BIGINT||True|False|False|False|
|tmp_tables|BIGINT||True|False|False|False|
|tmp_disk_tables|BIGINT||True|False|False|False|
|full_scan|VARCHAR|3|False|False|False|True|
|last_statement|LONGTEXT||False|False|False|False|
|last_statement_latency|VARCHAR|11|False|False|False|False|
|current_memory|VARCHAR|11|False|False|False|False|
|last_wait|VARCHAR|128|False|False|False|False|
|last_wait_latency|VARCHAR|13|False|False|False|False|
|source|VARCHAR|64|False|False|False|False|
|trx_latency|VARCHAR|11|False|False|False|False|
|trx_state|ENUM|0|False|False|False|False|
|trx_autocommit|ENUM|0|False|False|False|False|
|pid|VARCHAR|1024|False|False|True|False|
|program_name|VARCHAR|1024|False|False|True|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW session
AS
	SELECT
	  `processlist`.`thd_id` AS `thd_id`,
	  `processlist`.`conn_id` AS `conn_id`,
	  `processlist`.`user` AS `user`,
	  `processlist`.`db` AS `db`,
	  `processlist`.`command` AS `command`,
	  `processlist`.`state` AS `state`,
	  `processlist`.`time` AS `time`,
	  `processlist`.`current_statement` AS `current_statement`,
	  `processlist`.`statement_latency` AS `statement_latency`,
	  `processlist`.`progress` AS `progress`,
	  `processlist`.`lock_latency` AS `lock_latency`,
	  `processlist`.`rows_examined` AS `rows_examined`,
	  `processlist`.`rows_sent` AS `rows_sent`,
	  `processlist`.`rows_affected` AS `rows_affected`,
	  `processlist`.`tmp_tables` AS `tmp_tables`,
	  `processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,
	  `processlist`.`full_scan` AS `full_scan`,
	  `processlist`.`last_statement` AS `last_statement`,
	  `processlist`.`last_statement_latency` AS `last_statement_latency`,
	  `processlist`.`current_memory` AS `current_memory`,
	  `processlist`.`last_wait` AS `last_wait`,
	  `processlist`.`last_wait_latency` AS `last_wait_latency`,
	  `processlist`.`source` AS `source`,
	  `processlist`.`trx_latency` AS `trx_latency`,
	  `processlist`.`trx_state` AS `trx_state`,
	  `processlist`.`trx_autocommit` AS `trx_autocommit`,
	  `processlist`.`pid` AS `pid`,
	  `processlist`.`program_name` AS `program_name`
	FROM `processlist`
	WHERE ((`processlist`.`conn_id` IS NOT NULL)
	AND (`processlist`.`command` <> 'Daemon'));
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![View](../../../../../Images/view.svg) [processlist](processlist.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial