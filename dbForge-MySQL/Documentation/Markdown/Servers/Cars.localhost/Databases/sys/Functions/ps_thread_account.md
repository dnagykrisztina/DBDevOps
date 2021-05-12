[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_thread_account


# ![logo](../../../../../Images/function64.svg) ps_thread_account

## <a name="#Description"></a>Description
> > Description> -----------> > Return the user@host account for the given Performance Schema thread id.> > Parameters> -----------> > in_thread_id (BIGINT UNSIGNED):>   The id of the thread to return the account for.> > Example> -----------> > mysql> select thread_id, processlist_user, processlist_host from performance_schema.threads where type = 'foreground';> +-----------+------------------+------------------+> | thread_id | processlist_user | processlist_host |> +-----------+------------------+------------------+> |        23 | NULL             | NULL             |> |        30 | root             | localhost        |> |        31 | msandbox         | localhost        |> |        32 | msandbox         | localhost        |> +-----------+------------------+------------------+> 4 rows in set (0.00 sec)> > mysql> select sys.ps_thread_account(31);> +---------------------------+> | sys.ps_thread_account(31) |> +---------------------------+> | msandbox@localhost        |> +---------------------------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
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
|in_thread_id|BIGINT||20||
|(Result)|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_thread_account(
        in_thread_id BIGINT UNSIGNED
    )
  RETURNS TEXT CHARSET utf8mb4
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Return the user@host account for the given Performance Schema thread id.

Parameters
-----------

in_thread_id (BIGINT UNSIGNED):
  The id of the thread to return the account for.

Example
-----------

mysql> select thread_id, processlist_user, processlist_host from performance_schema.threads where type = ''foreground'';
+-----------+------------------+------------------+
| thread_id | processlist_user | processlist_host |
+-----------+------------------+------------------+
|        23 | NULL             | NULL             |
|        30 | root             | localhost        |
|        31 | msandbox         | localhost        |
|        32 | msandbox         | localhost        |
+-----------+------------------+------------------+
4 rows in set (0.00 sec)

mysql> select sys.ps_thread_account(31);
+---------------------------+
| sys.ps_thread_account(31) |
+---------------------------+
| msandbox@localhost        |
+---------------------------+
1 row in set (0.00 sec)
'
BEGIN
    RETURN (SELECT IF(
                      type = 'FOREGROUND',
                      CONCAT(processlist_user, '@', processlist_host),
                      type
                     ) AS account
              FROM `performance_schema`.`threads`
             WHERE thread_id = in_thread_id);
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![View](../../../../../Images/view.svg) [schema_table_lock_waits](../Views/schema_table_lock_waits.md)
- ![View](../../../../../Images/view.svg) [x$schema_table_lock_waits](../Views/x$schema_table_lock_waits.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial