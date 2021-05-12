[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>list_drop


# ![logo](../../../../../Images/function64.svg) list_drop

## <a name="#Description"></a>Description
> > Description> -----------> > Takes a list, and a value to attempt to remove from the list, and returns the resulting list.> > Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.> > Parameters> -----------> > in_list (TEXT):>   The comma separated list to drop a value from> > in_drop_value (TEXT):>   The value to drop from the input list> > Returns> -----------> > TEXT> > Example> --------> > mysql> select @@sql_mode;> +-----------------------------------------------------------------------------------------------+> | @@sql_mode                                                                                    |> +-----------------------------------------------------------------------------------------------+> | ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |> +-----------------------------------------------------------------------------------------------+> 1 row in set (0.00 sec)> > mysql> set sql_mode = sys.list_drop(@@sql_mode, 'ONLY_FULL_GROUP_BY');> Query OK, 0 rows affected (0.03 sec)> > mysql> select @@sql_mode;> +----------------------------------------------------------------------------+> | @@sql_mode                                                                 |> +----------------------------------------------------------------------------+> | ANSI_QUOTES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |> +----------------------------------------------------------------------------+> 1 row in set (0.00 sec)> > 
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
|in_drop_value|TEXT||||
|(Result)|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION list_drop(
        in_list TEXT,
        in_drop_value TEXT
    )
  RETURNS TEXT CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  COMMENT '
Description
-----------

Takes a list, and a value to attempt to remove from the list, and returns the resulting list.

Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.

Parameters
-----------

in_list (TEXT):
  The comma separated list to drop a value from

in_drop_value (TEXT):
  The value to drop from the input list

Returns
-----------

TEXT

Example
--------

mysql> select @@sql_mode;
+-----------------------------------------------------------------------------------------------+
| @@sql_mode                                                                                    |
+-----------------------------------------------------------------------------------------------+
| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> set sql_mode = sys.list_drop(@@sql_mode, ''ONLY_FULL_GROUP_BY'');
Query OK, 0 rows affected (0.03 sec)

mysql> select @@sql_mode;
+----------------------------------------------------------------------------+
| @@sql_mode                                                                 |
+----------------------------------------------------------------------------+
| ANSI_QUOTES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
+----------------------------------------------------------------------------+
1 row in set (0.00 sec)

'
BEGIN
    IF (in_drop_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_drop: in_drop_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the list as it was passed in
        RETURN in_list;
    END IF;
    -- ensure that leading / trailing commas are remove, support values with either spaces or not between commas
    RETURN (SELECT TRIM(BOTH ',' FROM REPLACE(REPLACE(CONCAT(',', in_list), CONCAT(',', in_drop_value), ''), CONCAT(', ', in_drop_value), '')));
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