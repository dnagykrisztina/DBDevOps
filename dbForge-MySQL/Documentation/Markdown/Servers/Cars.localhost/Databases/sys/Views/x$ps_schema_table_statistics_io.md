[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$ps_schema_table_statistics_io


# ![logo](../../../../../Images/view64.svg) x$ps_schema_table_statistics_io


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
|count_read|DECIMAL||False|False|False|False|
|sum_number_of_bytes_read|DECIMAL||False|False|False|False|
|sum_timer_read|DECIMAL||False|False|False|False|
|count_write|DECIMAL||False|False|False|False|
|sum_number_of_bytes_write|DECIMAL||False|False|False|False|
|sum_timer_write|DECIMAL||False|False|False|False|
|count_misc|DECIMAL||False|False|False|False|
|sum_timer_misc|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$ps_schema_table_statistics_io
AS
	SELECT
	  `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,
	  `extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,
	  SUM(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc`
	FROM `performance_schema`.`file_summary_by_instance`
	GROUP BY `table_schema`,
	         `table_name`;
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Function](../../../../../Images/function.svg) [extract_schema_from_file_name](../Functions/extract_schema_from_file_name.md)
- ![Function](../../../../../Images/function.svg) [extract_table_from_file_name](../Functions/extract_table_from_file_name.md)


## <a name="#UsedBy"></a>Used By _`4`_
- ![View](../../../../../Images/view.svg) [schema_table_statistics](schema_table_statistics.md)
- ![View](../../../../../Images/view.svg) [schema_table_statistics_with_buffer](schema_table_statistics_with_buffer.md)
- ![View](../../../../../Images/view.svg) [x$schema_table_statistics](x$schema_table_statistics.md)
- ![View](../../../../../Images/view.svg) [x$schema_table_statistics_with_buffer](x$schema_table_statistics_with_buffer.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial