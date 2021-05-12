[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>io_global_by_file_by_bytes


# ![logo](../../../../../Images/view64.svg) io_global_by_file_by_bytes


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
|file|VARCHAR|512|False|False|False|False|
|count_read|BIGINT||True|False|False|True|
|total_read|VARCHAR|11|False|False|False|False|
|avg_read|VARCHAR|11|False|False|False|False|
|count_write|BIGINT||True|False|False|True|
|total_written|VARCHAR|11|False|False|False|False|
|avg_write|VARCHAR|11|False|False|False|False|
|total|VARCHAR|11|False|False|False|False|
|write_pct|DECIMAL||False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = MERGE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW io_global_by_file_by_bytes
AS
	SELECT
	  `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
	  format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,
	  format_bytes(IFNULL((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / NULLIF(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`, 0)), 0)) AS `avg_read`,
	  `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
	  format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,
	  format_bytes(IFNULL((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / NULLIF(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`, 0)), 0.00)) AS `avg_write`,
	  format_bytes((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,
	  IFNULL(ROUND((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / NULLIF((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`), 0)) * 100)), 2), 0.00) AS `write_pct`
	FROM `performance_schema`.`file_summary_by_instance`
	ORDER BY (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) DESC;
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Function](../../../../../Images/function.svg) [format_path](../Functions/format_path.md)
- ![Function](../../../../../Images/function.svg) [format_bytes](../Functions/format_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial