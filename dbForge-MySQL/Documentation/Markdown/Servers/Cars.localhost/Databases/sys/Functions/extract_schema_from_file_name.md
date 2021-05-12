[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>extract_schema_from_file_name


# ![logo](../../../../../Images/function64.svg) extract_schema_from_file_name

## <a name="#Description"></a>Description
> > Description> -----------> > Takes a raw file path, and attempts to extract the schema name from it.> > Useful for when interacting with Performance Schema data > concerning IO statistics, for example.> > Currently relies on the fact that a table data file will be within a > specified database directory (will not work with partitions or tables> that specify an individual DATA_DIRECTORY).> > Parameters> -----------> > path (VARCHAR(512)):>   The full file path to a data file to extract the schema name from.> > Returns> -----------> > VARCHAR(64)> > Example> -----------> > mysql> SELECT sys.extract_schema_from_file_name('/var/lib/mysql/employees/employee.ibd');> +----------------------------------------------------------------------------+> | sys.extract_schema_from_file_name('/var/lib/mysql/employees/employee.ibd') |> +----------------------------------------------------------------------------+> | employees                                                                  |> +----------------------------------------------------------------------------+> 1 row in set (0.00 sec)> 
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
|path|VARCHAR|512|||
|(Result)|VARCHAR|64|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION extract_schema_from_file_name(
        path VARCHAR(512)
    )
  RETURNS VARCHAR(64) CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Takes a raw file path, and attempts to extract the schema name from it.

Useful for when interacting with Performance Schema data 
concerning IO statistics, for example.

Currently relies on the fact that a table data file will be within a 
specified database directory (will not work with partitions or tables
that specify an individual DATA_DIRECTORY).

Parameters
-----------

path (VARCHAR(512)):
  The full file path to a data file to extract the schema name from.

Returns
-----------

VARCHAR(64)

Example
-----------

mysql> SELECT sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'');
+----------------------------------------------------------------------------+
| sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |
+----------------------------------------------------------------------------+
| employees                                                                  |
+----------------------------------------------------------------------------+
1 row in set (0.00 sec)
'
BEGIN
    RETURN LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -2), '/', 1), 64);
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`1`_
- ![View](../../../../../Images/view.svg) [x$ps_schema_table_statistics_io](../Views/x$ps_schema_table_statistics_io.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial