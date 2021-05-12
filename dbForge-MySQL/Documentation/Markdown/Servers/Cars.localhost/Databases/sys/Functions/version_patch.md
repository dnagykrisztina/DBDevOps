[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>version_patch


# ![logo](../../../../../Images/function64.svg) version_patch

## <a name="#Description"></a>Description
> > Description> -----------> > Returns the patch release version of MySQL Server.> > Returns> -----------> > TINYINT UNSIGNED> > Example> -----------> > mysql> SELECT VERSION(), sys.version_patch();> +--------------------------------------+---------------------+> | VERSION()                            | sys.version_patch() |> +--------------------------------------+---------------------+> | 5.7.9-enterprise-commercial-advanced | 9                   |> +--------------------------------------+---------------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|NO SQL|
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
|(Result)|TINYINT||4||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION version_patch()
  RETURNS TINYINT(4)
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Returns the patch release version of MySQL Server.

Returns
-----------

TINYINT UNSIGNED

Example
-----------

mysql> SELECT VERSION(), sys.version_patch();
+--------------------------------------+---------------------+
| VERSION()                            | sys.version_patch() |
+--------------------------------------+---------------------+
| 5.7.9-enterprise-commercial-advanced | 9                   |
+--------------------------------------+---------------------+
1 row in set (0.00 sec)
'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', -1);
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