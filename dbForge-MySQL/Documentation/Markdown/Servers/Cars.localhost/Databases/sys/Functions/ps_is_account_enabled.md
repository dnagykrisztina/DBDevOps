[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_is_account_enabled


# ![logo](../../../../../Images/function64.svg) ps_is_account_enabled

## <a name="#Description"></a>Description
> > Description> -----------> > Determines whether instrumentation of an account is enabled > within Performance Schema.> > Parameters> -----------> > in_host VARCHAR(255): >   The hostname of the account to check.> in_user VARCHAR(32):>   The username of the account to check.> > Returns> -----------> > ENUM('YES', 'NO', 'PARTIAL')> > Example> -----------> > mysql> SELECT sys.ps_is_account_enabled('localhost', 'root');> +------------------------------------------------+> | sys.ps_is_account_enabled('localhost', 'root') |> +------------------------------------------------+> | YES                                            |> +------------------------------------------------+> 1 row in set (0.01 sec)> 
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
|in_host|VARCHAR|255|||
|in_user|VARCHAR|32|||
|(Result)|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_is_account_enabled(
        in_host VARCHAR(255), 
        in_user VARCHAR(32)
    )
  RETURNS ENUM('YES','NO') CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Determines whether instrumentation of an account is enabled 
within Performance Schema.

Parameters
-----------

in_host VARCHAR(255): 
  The hostname of the account to check.
in_user VARCHAR(32):
  The username of the account to check.

Returns
-----------

ENUM(''YES'', ''NO'', ''PARTIAL'')

Example
-----------

mysql> SELECT sys.ps_is_account_enabled(''localhost'', ''root'');
+------------------------------------------------+
| sys.ps_is_account_enabled(''localhost'', ''root'') |
+------------------------------------------------+
| YES                                            |
+------------------------------------------------+
1 row in set (0.01 sec)
'
BEGIN
    RETURN IF(EXISTS(SELECT 1
                       FROM performance_schema.setup_actors
                      WHERE (`HOST` = '%' OR in_host LIKE `HOST`)
                        AND (`USER` = '%' OR `USER` = in_user)
                        AND (`ENABLED` = 'YES')
                    ),
              'YES', 'NO'
           );
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [ps_setup_reload_saved](../Procedures/ps_setup_reload_saved.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial