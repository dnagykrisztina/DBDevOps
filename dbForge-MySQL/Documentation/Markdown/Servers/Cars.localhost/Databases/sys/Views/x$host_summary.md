[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$host_summary


# ![logo](../../../../../Images/view64.svg) x$host_summary


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
|host|VARCHAR|255|False|False|False|False|
|statements|DECIMAL||False|False|False|False|
|statement_latency|DECIMAL||False|False|False|False|
|statement_avg_latency|DECIMAL||False|False|False|False|
|table_scans|DECIMAL||False|False|False|False|
|file_ios|DECIMAL||False|False|False|False|
|file_io_latency|DECIMAL||False|False|False|False|
|current_connections|DECIMAL||False|False|False|False|
|total_connections|DECIMAL||False|False|False|False|
|unique_users|BIGINT||False|False|False|True|
|current_memory|DECIMAL||False|False|False|False|
|total_memory_allocated|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$host_summary
AS
	SELECT
	  IF((`performance_schema`.`accounts`.`HOST` IS NULL), 'background', `performance_schema`.`accounts`.`HOST`) AS `host`,
	  SUM(`stmt`.`total`) AS `statements`,
	  SUM(`stmt`.`total_latency`) AS `statement_latency`,
	  (SUM(`stmt`.`total_latency`) / SUM(`stmt`.`total`)) AS `statement_avg_latency`,
	  SUM(`stmt`.`full_scans`) AS `table_scans`,
	  SUM(`io`.`ios`) AS `file_ios`,
	  SUM(`io`.`io_latency`) AS `file_io_latency`,
	  SUM(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,
	  SUM(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,
	  COUNT(DISTINCT `performance_schema`.`accounts`.`USER`) AS `unique_users`,
	  SUM(`mem`.`current_allocated`) AS `current_memory`,
	  SUM(`mem`.`total_allocated`) AS `total_memory_allocated`
	FROM (((`performance_schema`.`accounts`
	  JOIN `x$host_summary_by_statement_latency` `stmt`
	    ON ((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`)))
	  JOIN `x$host_summary_by_file_io` `io`
	    ON ((`performance_schema`.`accounts`.`HOST` = `io`.`host`)))
	  JOIN `x$memory_by_host_by_current_bytes` `mem`
	    ON ((`performance_schema`.`accounts`.`HOST` = `mem`.`host`)))
	GROUP BY IF((`performance_schema`.`accounts`.`HOST` IS NULL), 'background', `performance_schema`.`accounts`.`HOST`);
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![View](../../../../../Images/view.svg) [x$host_summary_by_statement_latency](x$host_summary_by_statement_latency.md)
- ![View](../../../../../Images/view.svg) [x$host_summary_by_file_io](x$host_summary_by_file_io.md)
- ![View](../../../../../Images/view.svg) [x$memory_by_host_by_current_bytes](x$memory_by_host_by_current_bytes.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial