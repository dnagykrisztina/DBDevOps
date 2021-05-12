[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>metrics


# ![logo](../../../../../Images/view64.svg) metrics


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
|Variable_name|VARCHAR|193|False|False|False|True|
|Variable_value|TEXT||False|False|False|False|
|Type|VARCHAR|210|False|False|False|True|
|Enabled|VARCHAR|7|False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW metrics
AS
	SELECT
	  LOWER(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,
	  `performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,
	  'Global Status' AS `Type`,
	  'YES' AS `Enabled`
	FROM `performance_schema`.`global_status`
	UNION ALL
	SELECT
	  `information_schema`.`INNODB_METRICS`.`NAME` AS `Variable_name`,
	  `information_schema`.`INNODB_METRICS`.`COUNT` AS `Variable_value`,
	  CONCAT('InnoDB Metrics - ', `information_schema`.`INNODB_METRICS`.`SUBSYSTEM`) AS `Type`,
	  IF((`information_schema`.`INNODB_METRICS`.`STATUS` = 'enabled'), 'YES', 'NO') AS `Enabled`
	FROM `information_schema`.`INNODB_METRICS`
	WHERE (`information_schema`.`INNODB_METRICS`.`NAME` NOT IN ('lock_row_lock_time', 'lock_row_lock_time_avg', 'lock_row_lock_time_max', 'lock_row_lock_waits', 'buffer_pool_reads', 'buffer_pool_read_requests', 'buffer_pool_write_requests', 'buffer_pool_wait_free', 'buffer_pool_read_ahead', 'buffer_pool_read_ahead_evicted', 'buffer_pool_pages_total', 'buffer_pool_pages_misc', 'buffer_pool_pages_data', 'buffer_pool_bytes_data', 'buffer_pool_pages_dirty', 'buffer_pool_bytes_dirty', 'buffer_pool_pages_free', 'buffer_pages_created', 'buffer_pages_written', 'buffer_pages_read', 'buffer_data_reads', 'buffer_data_written', 'file_num_open_files', 'os_log_bytes_written', 'os_log_fsyncs', 'os_log_pending_fsyncs', 'os_log_pending_writes', 'log_waits', 'log_write_requests', 'log_writes', 'innodb_dblwr_writes', 'innodb_dblwr_pages_written', 'innodb_page_size'))
	UNION ALL
	SELECT
	  'memory_current_allocated' AS `Variable_name`,
	  SUM(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,
	  'Performance Schema' AS `Type`,
	  IF(((SELECT
	      COUNT(0)
	    FROM `performance_schema`.`setup_instruments`
	    WHERE ((`performance_schema`.`setup_instruments`.`NAME` LIKE 'memory/%')
	    AND (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0), 'NO', IF(((SELECT
	      COUNT(0)
	    FROM `performance_schema`.`setup_instruments`
	    WHERE ((`performance_schema`.`setup_instruments`.`NAME` LIKE 'memory/%')
	    AND (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0), 'YES', 'PARTIAL')) AS `Enabled`
	FROM `performance_schema`.`memory_summary_global_by_event_name`
	UNION ALL
	SELECT
	  'memory_total_allocated' AS `Variable_name`,
	  SUM(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,
	  'Performance Schema' AS `Type`,
	  IF(((SELECT
	      COUNT(0)
	    FROM `performance_schema`.`setup_instruments`
	    WHERE ((`performance_schema`.`setup_instruments`.`NAME` LIKE 'memory/%')
	    AND (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0), 'NO', IF(((SELECT
	      COUNT(0)
	    FROM `performance_schema`.`setup_instruments`
	    WHERE ((`performance_schema`.`setup_instruments`.`NAME` LIKE 'memory/%')
	    AND (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0), 'YES', 'PARTIAL')) AS `Enabled`
	FROM `performance_schema`.`memory_summary_global_by_event_name`
	UNION ALL
	SELECT
	  'NOW()' AS `Variable_name`,
	  NOW(3) AS `Variable_value`,
	  'System Time' AS `Type`,
	  'YES' AS `Enabled`
	UNION ALL
	SELECT
	  'UNIX_TIMESTAMP()' AS `Variable_name`,
	  ROUND(UNIX_TIMESTAMP(NOW(3)), 3) AS `Variable_value`,
	  'System Time' AS `Type`,
	  'YES' AS `Enabled`
	ORDER BY `Type`, `Variable_name`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial