[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_is_consumer_enabled


# ![logo](../../../../../Images/function64.svg) ps_is_consumer_enabled

## <a name="#Description"></a>Description
> > Description> -----------> > Determines whether a consumer is enabled (taking the consumer hierarchy into consideration)> within the Performance Schema.> > An exception with errno 3047 is thrown if an unknown consumer name is passed to the function.> A consumer name of NULL returns NULL.> > Parameters> -----------> > in_consumer VARCHAR(64): >   The name of the consumer to check.> > Returns> -----------> > ENUM('YES', 'NO')> > Example> -----------> > mysql> SELECT sys.ps_is_consumer_enabled('events_stages_history');> +-----------------------------------------------------+> | sys.ps_is_consumer_enabled('events_stages_history') |> +-----------------------------------------------------+> | NO                                                  |> +-----------------------------------------------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
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
|in_consumer|VARCHAR|64|||
|(Result)|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_is_consumer_enabled(
        in_consumer varchar(64)
   )
  RETURNS ENUM('YES','NO') CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Determines whether a consumer is enabled (taking the consumer hierarchy into consideration)
within the Performance Schema.

An exception with errno 3047 is thrown if an unknown consumer name is passed to the function.
A consumer name of NULL returns NULL.

Parameters
-----------

in_consumer VARCHAR(64): 
  The name of the consumer to check.

Returns
-----------

ENUM(''YES'', ''NO'')

Example
-----------

mysql> SELECT sys.ps_is_consumer_enabled(''events_stages_history'');
+-----------------------------------------------------+
| sys.ps_is_consumer_enabled(''events_stages_history'') |
+-----------------------------------------------------+
| NO                                                  |
+-----------------------------------------------------+
1 row in set (0.00 sec)
'
BEGIN
    DECLARE v_is_enabled ENUM('YES', 'NO') DEFAULT NULL;
    DECLARE v_error_msg VARCHAR(128);
    -- Return NULL for a NULL argument.
    IF (in_consumer IS NULL) THEN
        RETURN NULL;
    END IF;
    SET v_is_enabled = (
        SELECT (CASE
                   WHEN c.NAME = 'global_instrumentation' THEN c.ENABLED
                   WHEN c.NAME = 'thread_instrumentation' THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_digest'           THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_current'          THEN IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   ELSE IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES'
                           AND ( SELECT cc.ENABLED FROM performance_schema.setup_consumers cc WHERE NAME = CONCAT(SUBSTRING_INDEX(c.NAME, '_', 2), '_current')
                               ) = 'YES', 'YES', 'NO')
                END) AS IsEnabled
          FROM performance_schema.setup_consumers c
               INNER JOIN performance_schema.setup_consumers cg
               INNER JOIN performance_schema.setup_consumers ct
         WHERE cg.NAME       = 'global_instrumentation'
               AND ct.NAME   = 'thread_instrumentation'
               AND c.NAME    = in_consumer
        );
    IF (v_is_enabled IS NOT NULL) THEN
        RETURN v_is_enabled;
    ELSE
        -- A value of NULL here means it is an unknown consumer name that was passed as an argument.
        -- Only an input value of NULL is allowed to return a NULL result value, to throw a signal instead.
        SET v_error_msg = CONCAT('Invalid argument error: ', in_consumer, ' in function sys.ps_is_consumer_enabled.');
        SIGNAL SQLSTATE 'HY000'
           SET MESSAGE_TEXT = v_error_msg,
               MYSQL_ERRNO  = 3047;
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