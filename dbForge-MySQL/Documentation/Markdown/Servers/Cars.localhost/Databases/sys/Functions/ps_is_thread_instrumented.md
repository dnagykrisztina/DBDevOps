[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_is_thread_instrumented


# ![logo](../../../../../Images/function64.svg) ps_is_thread_instrumented

## <a name="#Description"></a>Description
> > Description> -----------> > Checks whether the provided connection id is instrumented within Performance Schema.> > Parameters> -----------> > in_connection_id (BIGINT UNSIGNED):>   The id of the connection to check.> > Returns> -----------> > ENUM('YES', 'NO', 'UNKNOWN')> > Example> -----------> > mysql> SELECT sys.ps_is_thread_instrumented(CONNECTION_ID());> +------------------------------------------------+> | sys.ps_is_thread_instrumented(CONNECTION_ID()) |> +------------------------------------------------+> | YES                                            |> +------------------------------------------------+> 
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
|(Result)|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_is_thread_instrumented(
        in_connection_id BIGINT UNSIGNED
    )
  RETURNS ENUM('YES','NO','UNKNOWN') CHARSET utf8mb4
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Checks whether the provided connection id is instrumented within Performance Schema.

Parameters
-----------

in_connection_id (BIGINT UNSIGNED):
  The id of the connection to check.

Returns
-----------

ENUM(''YES'', ''NO'', ''UNKNOWN'')

Example
-----------

mysql> SELECT sys.ps_is_thread_instrumented(CONNECTION_ID());
+------------------------------------------------+
| sys.ps_is_thread_instrumented(CONNECTION_ID()) |
+------------------------------------------------+
| YES                                            |
+------------------------------------------------+
'
BEGIN
    DECLARE v_enabled ENUM('YES', 'NO', 'UNKNOWN');
    IF (in_connection_id IS NULL) THEN
        RETURN NULL;
    END IF;
    SELECT INSTRUMENTED INTO v_enabled
      FROM performance_schema.threads 
     WHERE PROCESSLIST_ID = in_connection_id;
    IF (v_enabled IS NULL) THEN
        RETURN 'UNKNOWN';
    ELSE
        RETURN v_enabled;
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