[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>schema_table_statistics_with_buffer


# ![logo](../../../../../Images/view64.svg) schema_table_statistics_with_buffer


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
|table_schema|VARCHAR|64|False|False|False|False|
|table_name|VARCHAR|64|False|False|False|False|
|rows_fetched|BIGINT||True|False|False|True|
|fetch_latency|VARCHAR|11|False|False|False|False|
|rows_inserted|BIGINT||True|False|False|True|
|insert_latency|VARCHAR|11|False|False|False|False|
|rows_updated|BIGINT||True|False|False|True|
|update_latency|VARCHAR|11|False|False|False|False|
|rows_deleted|BIGINT||True|False|False|True|
|delete_latency|VARCHAR|11|False|False|False|False|
|io_read_requests|DECIMAL||False|False|False|False|
|io_read|VARCHAR|11|False|False|False|False|
|io_read_latency|VARCHAR|11|False|False|False|False|
|io_write_requests|DECIMAL||False|False|False|False|
|io_write|VARCHAR|11|False|False|False|False|
|io_write_latency|VARCHAR|11|False|False|False|False|
|io_misc_requests|DECIMAL||False|False|False|False|
|io_misc_latency|VARCHAR|11|False|False|False|False|
|innodb_buffer_allocated|VARCHAR|11|False|False|False|False|
|innodb_buffer_data|VARCHAR|11|False|False|False|False|
|innodb_buffer_free|VARCHAR|11|False|False|False|False|
|innodb_buffer_pages|BIGINT||False|False|False|False|
|innodb_buffer_pages_hashed|BIGINT||False|False|False|False|
|innodb_buffer_pages_old|BIGINT||False|False|False|False|
|innodb_buffer_rows_cached|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW schema_table_statistics_with_buffer
AS
	SELECT
	  `pst`.`OBJECT_SCHEMA` AS `table_schema`,
	  `pst`.`OBJECT_NAME` AS `table_name`,
	  `pst`.`COUNT_FETCH` AS `rows_fetched`,
	  format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,
	  `pst`.`COUNT_INSERT` AS `rows_inserted`,
	  format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,
	  `pst`.`COUNT_UPDATE` AS `rows_updated`,
	  format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,
	  `pst`.`COUNT_DELETE` AS `rows_deleted`,
	  format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,
	  `fsbi`.`count_read` AS `io_read_requests`,
	  format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,
	  format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,
	  `fsbi`.`count_write` AS `io_write_requests`,
	  format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,
	  format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,
	  `fsbi`.`count_misc` AS `io_misc_requests`,
	  format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,
	  format_bytes(`ibp`.`allocated`) AS `innodb_buffer_allocated`,
	  format_bytes(`ibp`.`data`) AS `innodb_buffer_data`,
	  format_bytes((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,
	  `ibp`.`pages` AS `innodb_buffer_pages`,
	  `ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,
	  `ibp`.`pages_old` AS `innodb_buffer_pages_old`,
	  `ibp`.`rows_cached` AS `innodb_buffer_rows_cached`
	FROM ((`performance_schema`.`table_io_waits_summary_by_table` `pst`
	  LEFT JOIN `x$ps_schema_table_statistics_io` `fsbi`
	    ON (((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`)
	    AND (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`))))
	  LEFT JOIN `x$innodb_buffer_stats_by_table` `ibp`
	    ON (((`pst`.`OBJECT_SCHEMA` = CONVERT(`ibp`.`object_schema` USING utf8mb4))
	    AND (`pst`.`OBJECT_NAME` = CONVERT(`ibp`.`object_name` USING utf8mb4)))))
	ORDER BY `pst`.`SUM_TIMER_WAIT` DESC;
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)
- ![View](../../../../../Images/view.svg) [x$ps_schema_table_statistics_io](x$ps_schema_table_statistics_io.md)
- ![View](../../../../../Images/view.svg) [x$innodb_buffer_stats_by_table](x$innodb_buffer_stats_by_table.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial