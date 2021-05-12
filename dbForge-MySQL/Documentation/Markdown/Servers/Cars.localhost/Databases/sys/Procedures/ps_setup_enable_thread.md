[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_enable_thread


# ![logo](../../../../../Images/procedure64.svg) ps_setup_enable_thread

## <a name="#Description"></a>Description
> > Description> -----------> > Enable the given connection/thread in Performance Schema.> > Parameters> -----------> > in_connection_id (BIGINT):>   The connection ID (PROCESSLIST_ID from performance_schema.threads>   or the ID shown within SHOW PROCESSLIST)> > Example> -----------> > mysql> CALL sys.ps_setup_enable_thread(3);> +------------------+> | summary          |> +------------------+> | Enabled 1 thread |> +------------------+> 1 row in set (0.01 sec)> > To enable the current connection:> > mysql> CALL sys.ps_setup_enable_thread(CONNECTION_ID());> +------------------+> | summary          |> +------------------+> | Enabled 1 thread |> +------------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|MODIFIES SQL DATA|
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
|in_connection_id|BIGINT||20||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_enable_thread(
        IN in_connection_id BIGINT
    )
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT '
Description
-----------

Enable the given connection/thread in Performance Schema.

Parameters
-----------

in_connection_id (BIGINT):
  The connection ID (PROCESSLIST_ID from performance_schema.threads
  or the ID shown within SHOW PROCESSLIST)

Example
-----------

mysql> CALL sys.ps_setup_enable_thread(3);
+------------------+
| summary          |
+------------------+
| Enabled 1 thread |
+------------------+
1 row in set (0.01 sec)

To enable the current connection:

mysql> CALL sys.ps_setup_enable_thread(CONNECTION_ID());
+------------------+
| summary          |
+------------------+
| Enabled 1 thread |
+------------------+
1 row in set (0.00 sec)
'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'YES'
     WHERE processlist_id = in_connection_id;
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary;
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![Procedure](../../../../../Images/procedure.svg) [ps_trace_statement_digest](ps_trace_statement_digest.md)
- ![Procedure](../../../../../Images/procedure.svg) [ps_trace_thread](ps_trace_thread.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial