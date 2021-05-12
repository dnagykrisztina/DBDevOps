[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$processlist


# ![logo](../../../../../Images/view64.svg) x$processlist


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
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$processlist
AS
	SELECT
	  `pps`.`THREAD_ID` AS `thd_id`,
	  `pps`.`PROCESSLIST_ID` AS `conn_id`,
	  IF((`pps`.`NAME` IN ('thread/sql/one_connection', 'thread/thread_pool/tp_one_connection')), CONCAT(`pps`.`PROCESSLIST_USER`, '@', CONVERT(`pps`.`PROCESSLIST_HOST` USING utf8mb4)), REPLACE(`pps`.`NAME`, 'thread/', '')) AS `user`,
	  `pps`.`PROCESSLIST_DB` AS `db`,
	  `pps`.`PROCESSLIST_COMMAND` AS `command`,
	  `pps`.`PROCESSLIST_STATE` AS `state`,
	  `pps`.`PROCESSLIST_TIME` AS `time`,
	  `pps`.`PROCESSLIST_INFO` AS `current_statement`,
	  IF((`esc`.`END_EVENT_ID` IS NULL), `esc`.`TIMER_WAIT`, NULL) AS `statement_latency`,
	  IF((`esc`.`END_EVENT_ID` IS NULL), ROUND((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)), 2), NULL) AS `progress`,
	  `esc`.`LOCK_TIME` AS `lock_latency`,
	  `esc`.`ROWS_EXAMINED` AS `rows_examined`,
	  `esc`.`ROWS_SENT` AS `rows_sent`,
	  `esc`.`ROWS_AFFECTED` AS `rows_affected`,
	  `esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,
	  `esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,
	  IF(((`esc`.`NO_GOOD_INDEX_USED` > 0) OR (`esc`.`NO_INDEX_USED` > 0)), 'YES', 'NO') AS `full_scan`,
	  IF((`esc`.`END_EVENT_ID` IS NOT NULL), `esc`.`SQL_TEXT`, NULL) AS `last_statement`,
	  IF((`esc`.`END_EVENT_ID` IS NOT NULL), `esc`.`TIMER_WAIT`, NULL) AS `last_statement_latency`,
	  `mem`.`current_allocated` AS `current_memory`,
	  `ewc`.`EVENT_NAME` AS `last_wait`,
	  IF(((`ewc`.`END_EVENT_ID` IS NULL) AND (`ewc`.`EVENT_NAME` IS NOT NULL)), 'Still Waiting', `ewc`.`TIMER_WAIT`) AS `last_wait_latency`,
	  `ewc`.`SOURCE` AS `source`,
	  `etc`.`TIMER_WAIT` AS `trx_latency`,
	  `etc`.`STATE` AS `trx_state`,
	  `etc`.`AUTOCOMMIT` AS `trx_autocommit`,
	  `conattr_pid`.`ATTR_VALUE` AS `pid`,
	  `conattr_progname`.`ATTR_VALUE` AS `program_name`
	FROM (((((((`performance_schema`.`threads` `pps`
	  LEFT JOIN `performance_schema`.`events_waits_current` `ewc`
	    ON ((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`)))
	  LEFT JOIN `performance_schema`.`events_stages_current` `estc`
	    ON ((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`)))
	  LEFT JOIN `performance_schema`.`events_statements_current` `esc`
	    ON ((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`)))
	  LEFT JOIN `performance_schema`.`events_transactions_current` `etc`
	    ON ((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`)))
	  LEFT JOIN `x$memory_by_thread_by_current_bytes` `mem`
	    ON ((`pps`.`THREAD_ID` = `mem`.`thread_id`)))
	  LEFT JOIN `performance_schema`.`session_connect_attrs` `conattr_pid`
	    ON (((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`)
	    AND (`conattr_pid`.`ATTR_NAME` = '_pid'))))
	  LEFT JOIN `performance_schema`.`session_connect_attrs` `conattr_progname`
	    ON (((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`)
	    AND (`conattr_progname`.`ATTR_NAME` = 'program_name'))))
	ORDER BY `pps`.`PROCESSLIST_TIME` DESC, `last_wait_latency` DESC;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![View](../../../../../Images/view.svg) [x$memory_by_thread_by_current_bytes](x$memory_by_thread_by_current_bytes.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![View](../../../../../Images/view.svg) [x$session](x$session.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial