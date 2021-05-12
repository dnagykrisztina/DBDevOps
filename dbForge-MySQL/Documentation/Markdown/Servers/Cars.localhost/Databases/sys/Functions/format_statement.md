[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>format_statement


# ![logo](../../../../../Images/function64.svg) format_statement

## <a name="#Description"></a>Description
> > Description> -----------> > Formats a normalized statement, truncating it if it is > 64 characters long by default.> > To configure the length to truncate the statement to by default, update the `statement_truncate_len`> variable with `sys_config` table to a different value. Alternatively, to change it just for just > your particular session, use `SET @sys.statement_truncate_len := <some new value>`.> > Useful for printing statement related data from Performance Schema from > the command line.> > Parameters> -----------> > statement (LONGTEXT): >   The statement to format.> > Returns> -----------> > LONGTEXT> > Example> -----------> > mysql> SELECT sys.format_statement(digest_text)>     ->   FROM performance_schema.events_statements_summary_by_digest>     ->  ORDER by sum_timer_wait DESC limit 5;> +-------------------------------------------------------------------+> | sys.format_statement(digest_text)                                 |> +-------------------------------------------------------------------+> | CREATE SQL SECURITY INVOKER VI ... KE ? AND `variable_value` > ?  |> | CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `esc` . ... |> | CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `sys` . ... |> | CREATE SQL SECURITY INVOKER VI ...  , `compressed_size` ) ) DESC  |> | CREATE SQL SECURITY INVOKER VI ... LIKE ? ORDER BY `timer_start`  |> +-------------------------------------------------------------------+> 5 rows in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|NO SQL|
|Deterministic|True|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Language|SQL|
|Created|2021. 04. 10. 15:36:58|
|Last Modified|2021. 04. 10. 15:36:58|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|statement|LONGTEXT||||
|(Result)|LONGTEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION format_statement(
        statement LONGTEXT
    )
  RETURNS LONGTEXT CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Formats a normalized statement, truncating it if it is > 64 characters long by default.

To configure the length to truncate the statement to by default, update the `statement_truncate_len`
variable with `sys_config` table to a different value. Alternatively, to change it just for just 
your particular session, use `SET @sys.statement_truncate_len := <some new value>`.

Useful for printing statement related data from Performance Schema from 
the command line.

Parameters
-----------

statement (LONGTEXT): 
  The statement to format.

Returns
-----------

LONGTEXT

Example
-----------

mysql> SELECT sys.format_statement(digest_text)
    ->   FROM performance_schema.events_statements_summary_by_digest
    ->  ORDER by sum_timer_wait DESC limit 5;
+-------------------------------------------------------------------+
| sys.format_statement(digest_text)                                 |
+-------------------------------------------------------------------+
| CREATE SQL SECURITY INVOKER VI ... KE ? AND `variable_value` > ?  |
| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `esc` . ... |
| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `sys` . ... |
| CREATE SQL SECURITY INVOKER VI ...  , `compressed_size` ) ) DESC  |
| CREATE SQL SECURITY INVOKER VI ... LIKE ? ORDER BY `timer_start`  |
+-------------------------------------------------------------------+
5 rows in set (0.00 sec)
'
BEGIN
  -- Check if we have the configured length, if not, init it
  IF @sys.statement_truncate_len IS NULL THEN
      SET @sys.statement_truncate_len = sys_get_config('statement_truncate_len', 64);
  END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [sys_get_config](sys_get_config.md)


## <a name="#UsedBy"></a>Used By _`9`_
- ![View](../../../../../Images/view.svg) [innodb_lock_waits](../Views/innodb_lock_waits.md)
- ![View](../../../../../Images/view.svg) [processlist](../Views/processlist.md)
- ![View](../../../../../Images/view.svg) [schema_table_lock_waits](../Views/schema_table_lock_waits.md)
- ![View](../../../../../Images/view.svg) [statement_analysis](../Views/statement_analysis.md)
- ![View](../../../../../Images/view.svg) [statements_with_errors_or_warnings](../Views/statements_with_errors_or_warnings.md)
- ![View](../../../../../Images/view.svg) [statements_with_full_table_scans](../Views/statements_with_full_table_scans.md)
- ![View](../../../../../Images/view.svg) [statements_with_runtimes_in_95th_percentile](../Views/statements_with_runtimes_in_95th_percentile.md)
- ![View](../../../../../Images/view.svg) [statements_with_sorting](../Views/statements_with_sorting.md)
- ![View](../../../../../Images/view.svg) [statements_with_temp_tables](../Views/statements_with_temp_tables.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial