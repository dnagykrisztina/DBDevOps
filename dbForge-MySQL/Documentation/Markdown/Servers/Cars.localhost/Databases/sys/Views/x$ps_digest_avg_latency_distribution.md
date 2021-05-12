[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$ps_digest_avg_latency_distribution


# ![logo](../../../../../Images/view64.svg) x$ps_digest_avg_latency_distribution


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
|cnt|BIGINT||False|False|False|True|
|avg_us|DECIMAL||False|False|False|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$ps_digest_avg_latency_distribution
AS
	SELECT
	  COUNT(0) AS `cnt`,
	  ROUND((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000), 0) AS `avg_us`
	FROM `performance_schema`.`events_statements_summary_by_digest`
	GROUP BY `avg_us`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![View](../../../../../Images/view.svg) [x$ps_digest_95th_percentile_by_avg_us](x$ps_digest_95th_percentile_by_avg_us.md)
- ![Procedure](../../../../../Images/procedure.svg) [ps_statement_avg_latency_histogram](../Procedures/ps_statement_avg_latency_histogram.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial