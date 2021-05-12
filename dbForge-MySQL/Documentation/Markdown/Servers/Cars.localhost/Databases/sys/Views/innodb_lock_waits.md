[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>innodb_lock_waits


# ![logo](../../../../../Images/view64.svg) innodb_lock_waits


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
|wait_started|DATETIME|0|False|False|False|False|
|wait_age|TIME|0|False|False|False|False|
|wait_age_secs|BIGINT||False|False|False|False|
|locked_table|MEDIUMTEXT||False|False|False|False|
|locked_table_schema|VARCHAR|64|False|False|False|False|
|locked_table_name|VARCHAR|64|False|False|False|False|
|locked_table_partition|VARCHAR|64|False|False|False|False|
|locked_table_subpartition|VARCHAR|64|False|False|False|False|
|locked_index|VARCHAR|64|False|False|False|False|
|locked_type|VARCHAR|32|False|False|False|True|
|waiting_trx_id|BIGINT||True|False|False|True|
|waiting_trx_started|DATETIME|0|False|False|False|True|
|waiting_trx_age|TIME|0|False|False|False|False|
|waiting_trx_rows_locked|BIGINT||True|False|False|True|
|waiting_trx_rows_modified|BIGINT||True|False|False|True|
|waiting_pid|BIGINT||True|False|False|True|
|waiting_query|LONGTEXT||False|False|False|False|
|waiting_lock_id|VARCHAR|128|False|False|False|True|
|waiting_lock_mode|VARCHAR|32|False|False|False|True|
|blocking_trx_id|BIGINT||True|False|False|True|
|blocking_pid|BIGINT||True|False|False|True|
|blocking_query|LONGTEXT||False|False|False|False|
|blocking_lock_id|VARCHAR|128|False|False|False|True|
|blocking_lock_mode|VARCHAR|32|False|False|False|True|
|blocking_trx_started|DATETIME|0|False|False|False|True|
|blocking_trx_age|TIME|0|False|False|False|False|
|blocking_trx_rows_locked|BIGINT||True|False|False|True|
|blocking_trx_rows_modified|BIGINT||True|False|False|True|
|sql_kill_blocking_query|VARCHAR|32|False|False|False|True|
|sql_kill_blocking_connection|VARCHAR|26|False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW innodb_lock_waits
AS
	SELECT
	  `r`.`trx_wait_started` AS `wait_started`,
	  TIMEDIFF(NOW(), `r`.`trx_wait_started`) AS `wait_age`,
	  TIMESTAMPDIFF(SECOND, `r`.`trx_wait_started`, NOW()) AS `wait_age_secs`,
	  CONCAT(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`), '.', `sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,
	  `rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,
	  `rl`.`OBJECT_NAME` AS `locked_table_name`,
	  `rl`.`PARTITION_NAME` AS `locked_table_partition`,
	  `rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,
	  `rl`.`INDEX_NAME` AS `locked_index`,
	  `rl`.`LOCK_TYPE` AS `locked_type`,
	  `r`.`trx_id` AS `waiting_trx_id`,
	  `r`.`trx_started` AS `waiting_trx_started`,
	  TIMEDIFF(NOW(), `r`.`trx_started`) AS `waiting_trx_age`,
	  `r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,
	  `r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,
	  `r`.`trx_mysql_thread_id` AS `waiting_pid`,
	  `sys`.`format_statement`(`r`.`trx_query`) AS `waiting_query`,
	  `rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,
	  `rl`.`LOCK_MODE` AS `waiting_lock_mode`,
	  `b`.`trx_id` AS `blocking_trx_id`,
	  `b`.`trx_mysql_thread_id` AS `blocking_pid`,
	  `sys`.`format_statement`(`b`.`trx_query`) AS `blocking_query`,
	  `bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,
	  `bl`.`LOCK_MODE` AS `blocking_lock_mode`,
	  `b`.`trx_started` AS `blocking_trx_started`,
	  TIMEDIFF(NOW(), `b`.`trx_started`) AS `blocking_trx_age`,
	  `b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,
	  `b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,
	  CONCAT('KILL QUERY ', `b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,
	  CONCAT('KILL ', `b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection`
	FROM ((((`performance_schema`.`data_lock_waits` `w`
	  JOIN `information_schema`.`INNODB_TRX` `b`
	    ON ((`b`.`trx_id` = CAST(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` AS char CHARSET utf8mb4))))
	  JOIN `information_schema`.`INNODB_TRX` `r`
	    ON ((`r`.`trx_id` = CAST(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` AS char CHARSET utf8mb4))))
	  JOIN `performance_schema`.`data_locks` `bl`
	    ON ((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`)))
	  JOIN `performance_schema`.`data_locks` `rl`
	    ON ((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`)))
	ORDER BY `r`.`trx_wait_started`;
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Function](../../../../../Images/function.svg) [quote_identifier](../Functions/quote_identifier.md)
- ![Function](../../../../../Images/function.svg) [format_statement](../Functions/format_statement.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial