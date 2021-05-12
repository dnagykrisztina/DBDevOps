[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>quote_identifier


# ![logo](../../../../../Images/function64.svg) quote_identifier

## <a name="#Description"></a>Description
> > Description> -----------> > Takes an unquoted identifier (schema name, table name, etc.) and> returns the identifier quoted with backticks.> > Parameters> -----------> > in_identifier (TEXT):>   The identifier to quote.> > Returns> -----------> > TEXT CHARSET UTF8MB4> > Example> -----------> > mysql> SELECT sys.quote_identifier('my_identifier') AS Identifier;> +-----------------+> | Identifier      |> +-----------------+> | `my_identifier` |> +-----------------+> 1 row in set (0.00 sec)> > mysql> SELECT sys.quote_identifier('my`idenfier') AS Identifier;> +----------------+> | Identifier     |> +----------------+> | `my``idenfier` |> +----------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|NO SQL|
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
|in_identifier|TEXT||||
|(Result)|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION quote_identifier(in_identifier TEXT)
  RETURNS TEXT CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Takes an unquoted identifier (schema name, table name, etc.) and
returns the identifier quoted with backticks.

Parameters
-----------

in_identifier (TEXT):
  The identifier to quote.

Returns
-----------

TEXT CHARSET UTF8MB4

Example
-----------

mysql> SELECT sys.quote_identifier(''my_identifier'') AS Identifier;
+-----------------+
| Identifier      |
+-----------------+
| `my_identifier` |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT sys.quote_identifier(''my`idenfier'') AS Identifier;
+----------------+
| Identifier     |
+----------------+
| `my``idenfier` |
+----------------+
1 row in set (0.00 sec)
'
BEGIN
    RETURN CONCAT('`', REPLACE(in_identifier, '`', '``'), '`');
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`3`_
- ![View](../../../../../Images/view.svg) [innodb_lock_waits](../Views/innodb_lock_waits.md)
- ![View](../../../../../Images/view.svg) [x$innodb_lock_waits](../Views/x$innodb_lock_waits.md)
- ![Procedure](../../../../../Images/procedure.svg) [create_synonym_db](../Procedures/create_synonym_db.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial