[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_show_enabled_consumers


# ![logo](../../../../../Images/procedure64.svg) ps_setup_show_enabled_consumers

## <a name="#Description"></a>Description
> > Description> -----------> > Shows all currently enabled consumers.> > Parameters> -----------> > None> > Example> -----------> > mysql> CALL sys.ps_setup_show_enabled_consumers();> > +---------------------------+> | enabled_consumers         |> +---------------------------+> | events_statements_current |> | global_instrumentation    |> | thread_instrumentation    |> | statements_digest         |> +---------------------------+> 4 rows in set (0.05 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
|Deterministic|True|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Language|SQL|
|Created|2021. 04. 10. 15:37:00|
|Last Modified|2021. 04. 10. 15:37:00|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_show_enabled_consumers()
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Shows all currently enabled consumers.

Parameters
-----------

None

Example
-----------

mysql> CALL sys.ps_setup_show_enabled_consumers();

+---------------------------+
| enabled_consumers         |
+---------------------------+
| events_statements_current |
| global_instrumentation    |
| thread_instrumentation    |
| statements_digest         |
+---------------------------+
4 rows in set (0.05 sec)
'
BEGIN
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial