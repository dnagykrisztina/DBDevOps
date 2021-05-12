[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>list_add


# ![logo](../../../../../Images/function64.svg) list_add

## <a name="#Description"></a>Description
> > Description> -----------> > Takes a list, and a value to add to the list, and returns the resulting list.> > Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.> > Parameters> -----------> > in_list (TEXT):>   The comma separated list to add a value to> > in_add_value (TEXT):>   The value to add to the input list> > Returns> -----------> > TEXT> > Example> --------> > mysql> select @@sql_mode;> +-----------------------------------------------------------------------------------+> | @@sql_mode                                                                        |> +-----------------------------------------------------------------------------------+> | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |> +-----------------------------------------------------------------------------------+> 1 row in set (0.00 sec)> > mysql> set sql_mode = sys.list_add(@@sql_mode, 'ANSI_QUOTES');> Query OK, 0 rows affected (0.06 sec)> > mysql> select @@sql_mode;> +-----------------------------------------------------------------------------------------------+> | @@sql_mode                                                                                    |> +-----------------------------------------------------------------------------------------------+> | ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |> +-----------------------------------------------------------------------------------------------+> 1 row in set (0.00 sec)> > 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
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
|in_list|TEXT||||
|in_add_value|TEXT||||
|(Result)|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION list_add(
        in_list TEXT,
        in_add_value TEXT
    )
  RETURNS TEXT CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  COMMENT '
Description
-----------

Takes a list, and a value to add to the list, and returns the resulting list.

Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.

Parameters
-----------

in_list (TEXT):
  The comma separated list to add a value to

in_add_value (TEXT):
  The value to add to the input list

Returns
-----------

TEXT

Example
--------

mysql> select @@sql_mode;
+-----------------------------------------------------------------------------------+
| @@sql_mode                                                                        |
+-----------------------------------------------------------------------------------+
| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> set sql_mode = sys.list_add(@@sql_mode, ''ANSI_QUOTES'');
Query OK, 0 rows affected (0.06 sec)

mysql> select @@sql_mode;
+-----------------------------------------------------------------------------------------------+
| @@sql_mode                                                                                    |
+-----------------------------------------------------------------------------------------------+
| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

'
BEGIN
    IF (in_add_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_add: in_add_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the new value as a single value list
        RETURN in_add_value;
    END IF;
    RETURN (SELECT CONCAT(TRIM(BOTH ',' FROM TRIM(in_list)), ',', in_add_value));
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