[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_show_disabled_instruments


# ![logo](../../../../../Images/procedure64.svg) ps_setup_show_disabled_instruments

## <a name="#Description"></a>Description
> > Description> -----------> > Shows all currently disabled instruments.> > Parameters> -----------> > None> > Example> -----------> > mysql> CALL sys.ps_setup_show_disabled_instruments();> 
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
CREATE PROCEDURE ps_setup_show_disabled_instruments()
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Shows all currently disabled instruments.

Parameters
-----------

None

Example
-----------

mysql> CALL sys.ps_setup_show_disabled_instruments();
'
BEGIN
    SELECT name AS disabled_instruments, timed
      FROM performance_schema.setup_instruments
     WHERE enabled = 'NO'
     ORDER BY disabled_instruments;
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