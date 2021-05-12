[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_thread_id


# ![logo](../../../../../Images/function64.svg) ps_thread_id

## <a name="#Description"></a>Description
> > Description> -----------> > Return the Performance Schema THREAD_ID for the specified connection ID.> > Parameters> -----------> > in_connection_id (BIGINT UNSIGNED):>   The id of the connection to return the thread id for. If NULL, the current>   connection thread id is returned.> > Example> -----------> > mysql> SELECT sys.ps_thread_id(79);> +----------------------+> | sys.ps_thread_id(79) |> +----------------------+> |                   98 |> +----------------------+> 1 row in set (0.00 sec)> > mysql> SELECT sys.ps_thread_id(CONNECTION_ID());> +-----------------------------------+> | sys.ps_thread_id(CONNECTION_ID()) |> +-----------------------------------+> |                                98 |> +-----------------------------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
|Deterministic|False|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Language|SQL|
|Created|2021. 04. 10. 15:36:58|
|Last Modified|2021. 04. 10. 15:36:58|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|in_connection_id|BIGINT||20||
|(Result)|BIGINT||20||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_thread_id(
        in_connection_id BIGINT UNSIGNED
    )
  RETURNS BIGINT(20)
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Return the Performance Schema THREAD_ID for the specified connection ID.

Parameters
-----------

in_connection_id (BIGINT UNSIGNED):
  The id of the connection to return the thread id for. If NULL, the current
  connection thread id is returned.

Example
-----------

mysql> SELECT sys.ps_thread_id(79);
+----------------------+
| sys.ps_thread_id(79) |
+----------------------+
|                   98 |
+----------------------+
1 row in set (0.00 sec)

mysql> SELECT sys.ps_thread_id(CONNECTION_ID());
+-----------------------------------+
| sys.ps_thread_id(CONNECTION_ID()) |
+-----------------------------------+
|                                98 |
+-----------------------------------+
1 row in set (0.00 sec)
'
BEGIN
  IF (in_connection_id IS NULL) THEN
    RETURN ps_current_thread_id();
  ELSE
    RETURN ps_thread_id(in_connection_id);
  END IF;
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