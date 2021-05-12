[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>format_bytes


# ![logo](../../../../../Images/function64.svg) format_bytes

## <a name="#Description"></a>Description
> > Description> -----------> > Takes a raw bytes value, and converts it to a human readable format.> > Parameters> -----------> > bytes (TEXT):>   A raw bytes value.> > Returns> -----------> > TEXT> > Example> -----------> > mysql> SELECT sys.format_bytes(2348723492723746) AS size;> +----------+> | size     |> +----------+> | 2.09 PiB |> +----------+> 1 row in set (0.00 sec)> > mysql> SELECT sys.format_bytes(2348723492723) AS size;> +----------+> | size     |> +----------+> | 2.14 TiB |> +----------+> 1 row in set (0.00 sec)> > mysql> SELECT sys.format_bytes(23487234) AS size;> +-----------+> | size      |> +-----------+> | 22.40 MiB |> +-----------+> 1 row in set (0.00 sec)> 
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
|bytes|TEXT||||
|(Result)|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION format_bytes(
        -- We feed in and return TEXT here, as aggregates of
        -- bytes can return numbers larger than BIGINT UNSIGNED
        bytes TEXT
    )
  RETURNS TEXT CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Takes a raw bytes value, and converts it to a human readable format.

Parameters
-----------

bytes (TEXT):
  A raw bytes value.

Returns
-----------

TEXT

Example
-----------

mysql> SELECT sys.format_bytes(2348723492723746) AS size;
+----------+
| size     |
+----------+
| 2.09 PiB |
+----------+
1 row in set (0.00 sec)

mysql> SELECT sys.format_bytes(2348723492723) AS size;
+----------+
| size     |
+----------+
| 2.14 TiB |
+----------+
1 row in set (0.00 sec)

mysql> SELECT sys.format_bytes(23487234) AS size;
+-----------+
| size      |
+-----------+
| 22.40 MiB |
+-----------+
1 row in set (0.00 sec)
'
BEGIN
  IF (bytes IS NULL) THEN
    RETURN NULL;
  ELSE
    RETURN format_bytes(bytes);
  END IF;
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`16`_
- ![View](../../../../../Images/view.svg) [host_summary](../Views/host_summary.md)
- ![View](../../../../../Images/view.svg) [innodb_buffer_stats_by_schema](../Views/innodb_buffer_stats_by_schema.md)
- ![View](../../../../../Images/view.svg) [innodb_buffer_stats_by_table](../Views/innodb_buffer_stats_by_table.md)
- ![View](../../../../../Images/view.svg) [io_global_by_file_by_bytes](../Views/io_global_by_file_by_bytes.md)
- ![View](../../../../../Images/view.svg) [io_global_by_wait_by_bytes](../Views/io_global_by_wait_by_bytes.md)
- ![View](../../../../../Images/view.svg) [io_global_by_wait_by_latency](../Views/io_global_by_wait_by_latency.md)
- ![View](../../../../../Images/view.svg) [latest_file_io](../Views/latest_file_io.md)
- ![View](../../../../../Images/view.svg) [memory_by_host_by_current_bytes](../Views/memory_by_host_by_current_bytes.md)
- ![View](../../../../../Images/view.svg) [memory_by_thread_by_current_bytes](../Views/memory_by_thread_by_current_bytes.md)
- ![View](../../../../../Images/view.svg) [memory_by_user_by_current_bytes](../Views/memory_by_user_by_current_bytes.md)
- ![View](../../../../../Images/view.svg) [memory_global_by_current_bytes](../Views/memory_global_by_current_bytes.md)
- ![View](../../../../../Images/view.svg) [memory_global_total](../Views/memory_global_total.md)
- ![View](../../../../../Images/view.svg) [processlist](../Views/processlist.md)
- ![View](../../../../../Images/view.svg) [schema_table_statistics](../Views/schema_table_statistics.md)
- ![View](../../../../../Images/view.svg) [schema_table_statistics_with_buffer](../Views/schema_table_statistics_with_buffer.md)
- ![View](../../../../../Images/view.svg) [user_summary](../Views/user_summary.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial