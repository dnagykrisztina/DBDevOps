[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_is_instrument_default_timed


# ![logo](../../../../../Images/function64.svg) ps_is_instrument_default_timed

## <a name="#Description"></a>Description
> > Description> -----------> > Returns whether an instrument is timed by default in this version of MySQL.> > Parameters> -----------> > in_instrument VARCHAR(128): >   The instrument to check.> > Returns> -----------> > ENUM('YES', 'NO')> > Example> -----------> > mysql> SELECT sys.ps_is_instrument_default_timed('statement/sql/select');> +------------------------------------------------------------+> | sys.ps_is_instrument_default_timed('statement/sql/select') |> +------------------------------------------------------------+> | YES                                                        |> +------------------------------------------------------------+> 1 row in set (0.00 sec)> 
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
|in_instrument|VARCHAR|128|||
|(Result)|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_is_instrument_default_timed(
        in_instrument VARCHAR(128)
    )
  RETURNS ENUM('YES','NO') CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Returns whether an instrument is timed by default in this version of MySQL.

Parameters
-----------

in_instrument VARCHAR(128): 
  The instrument to check.

Returns
-----------

ENUM(''YES'', ''NO'')

Example
-----------

mysql> SELECT sys.ps_is_instrument_default_timed(''statement/sql/select'');
+------------------------------------------------------------+
| sys.ps_is_instrument_default_timed(''statement/sql/select'') |
+------------------------------------------------------------+
| YES                                                        |
+------------------------------------------------------------+
1 row in set (0.00 sec)
'
BEGIN
    DECLARE v_timed ENUM('YES', 'NO');
    IF (in_instrument LIKE 'stage/%') THEN
    BEGIN
      -- Stages are timed by default if the progress property is set.
      SET v_timed = (SELECT
                      IF(find_in_set("progress", PROPERTIES) != 0, 'YES', 'NO')
                      FROM performance_schema.setup_instruments
                      WHERE NAME = in_instrument);
      SET v_timed = IFNULL(v_timed, 'NO');
    END;
    ELSE
      -- Mutex, rwlock, prlock, sxlock, cond are not timed by default
      -- Memory instruments are never timed.
      SET v_timed = IF(in_instrument LIKE 'wait/synch/%'
                       OR in_instrument LIKE 'memory/%'
                      ,
                       'NO',
                       'YES'
                    );
    END IF;
    RETURN v_timed;
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