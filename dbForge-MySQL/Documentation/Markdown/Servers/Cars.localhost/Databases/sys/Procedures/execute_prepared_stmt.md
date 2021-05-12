[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>execute_prepared_stmt


# ![logo](../../../../../Images/procedure64.svg) execute_prepared_stmt

## <a name="#Description"></a>Description
> > Description> -----------> > Takes the query in the argument and executes it using a prepared statement. The prepared statement is deallocated,> so the procedure is mainly useful for executing one off dynamically created queries.> > The sys_execute_prepared_stmt prepared statement name is used for the query and is required not to exist.> > > Parameters> -----------> > in_query (longtext CHARACTER SET UTF8MB4):>   The query to execute.> > > Configuration Options> ----------------------> > sys.debug>   Whether to provide debugging output.>   Default is 'OFF'. Set to 'ON' to include.> > > Example> --------> > mysql> CALL sys.execute_prepared_stmt('SELECT * FROM sys.sys_config');> +------------------------+-------+---------------------+--------+> | variable               | value | set_time            | set_by |> +------------------------+-------+---------------------+--------+> | statement_truncate_len | 64    | 2015-06-30 13:06:00 | NULL   |> +------------------------+-------+---------------------+--------+> 1 row in set (0.00 sec)> > Query OK, 0 rows affected (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
|Deterministic|False|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Language|SQL|
|Created|2021. 04. 10. 15:37:00|
|Last Modified|2021. 04. 10. 15:37:00|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|in_query|LONGTEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE execute_prepared_stmt(
        IN in_query longtext CHARACTER SET UTF8MB4
    )
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Takes the query in the argument and executes it using a prepared statement. The prepared statement is deallocated,
so the procedure is mainly useful for executing one off dynamically created queries.

The sys_execute_prepared_stmt prepared statement name is used for the query and is required not to exist.


Parameters
-----------

in_query (longtext CHARACTER SET UTF8MB4):
  The query to execute.


Configuration Options
----------------------

sys.debug
  Whether to provide debugging output.
  Default is ''OFF''. Set to ''ON'' to include.


Example
--------

mysql> CALL sys.execute_prepared_stmt(''SELECT * FROM sys.sys_config'');
+------------------------+-------+---------------------+--------+
| variable               | value | set_time            | set_by |
+------------------------+-------+---------------------+--------+
| statement_truncate_len | 64    | 2015-06-30 13:06:00 | NULL   |
+------------------------+-------+---------------------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
'
BEGIN
    -- Set configuration options
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug = sys.sys_get_config('debug', 'OFF');
    END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [sys_get_config](../Functions/sys_get_config.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial