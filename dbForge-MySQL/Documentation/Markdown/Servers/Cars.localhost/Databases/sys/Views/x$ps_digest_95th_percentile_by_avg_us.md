[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>x$ps_digest_95th_percentile_by_avg_us


# ![logo](../../../../../Images/view64.svg) x$ps_digest_95th_percentile_by_avg_us


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
|avg_us|DECIMAL||False|False|False|False|
|percentile|DECIMAL||False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	ALGORITHM = TEMPTABLE
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW x$ps_digest_95th_percentile_by_avg_us
AS
	SELECT
	  `s2`.`avg_us` AS `avg_us`,
	  IFNULL((SUM(`s1`.`cnt`) / NULLIF((SELECT
	      COUNT(0)
	    FROM `performance_schema`.`events_statements_summary_by_digest`), 0)), 0) AS `percentile`
	FROM (`x$ps_digest_avg_latency_distribution` `s1`
	  JOIN `x$ps_digest_avg_latency_distribution` `s2`
	    ON ((`s1`.`avg_us` <= `s2`.`avg_us`)))
	GROUP BY `s2`.`avg_us`
	HAVING (IFNULL((SUM(`s1`.`cnt`) / NULLIF((SELECT
	    COUNT(0)
	  FROM `performance_schema`.`events_statements_summary_by_digest`), 0)), 0) > 0.95)
	ORDER BY `percentile` LIMIT 1;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![View](../../../../../Images/view.svg) [x$ps_digest_avg_latency_distribution](x$ps_digest_avg_latency_distribution.md)


## <a name="#UsedBy"></a>Used By _`2`_
- ![View](../../../../../Images/view.svg) [statements_with_runtimes_in_95th_percentile](statements_with_runtimes_in_95th_percentile.md)
- ![View](../../../../../Images/view.svg) [x$statements_with_runtimes_in_95th_percentile](x$statements_with_runtimes_in_95th_percentile.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial