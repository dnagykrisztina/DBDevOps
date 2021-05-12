[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_show_disabled


# ![logo](../../../../../Images/procedure64.svg) ps_setup_show_disabled

## <a name="#Description"></a>Description
> > Description> -----------> > Shows all currently disable Performance Schema configuration.> > Disabled users is only available for MySQL 5.7.6 and later.> In earlier versions it was only possible to enable users.> > Parameters> -----------> > in_show_instruments (BOOLEAN):>   Whether to print disabled instruments (can print many items)> > in_show_threads (BOOLEAN):>   Whether to print disabled threads> > Example> -----------> > mysql> CALL sys.ps_setup_show_disabled(TRUE, TRUE);> +----------------------------+> | performance_schema_enabled |> +----------------------------+> |                          1 |> +----------------------------+> 1 row in set (0.00 sec)> > +--------------------+> | disabled_users     |> +--------------------+> | 'mark'@'localhost' |> +--------------------+> 1 row in set (0.00 sec)> > +-------------+----------------------+---------+-------+> | object_type | objects              | enabled | timed |> +-------------+----------------------+---------+-------+> | EVENT       | mysql.%              | NO      | NO    |> | EVENT       | performance_schema.% | NO      | NO    |> | EVENT       | information_schema.% | NO      | NO    |> | FUNCTION    | mysql.%              | NO      | NO    |> | FUNCTION    | performance_schema.% | NO      | NO    |> | FUNCTION    | information_schema.% | NO      | NO    |> | PROCEDURE   | mysql.%              | NO      | NO    |> | PROCEDURE   | performance_schema.% | NO      | NO    |> | PROCEDURE   | information_schema.% | NO      | NO    |> | TABLE       | mysql.%              | NO      | NO    |> | TABLE       | performance_schema.% | NO      | NO    |> | TABLE       | information_schema.% | NO      | NO    |> | TRIGGER     | mysql.%              | NO      | NO    |> | TRIGGER     | performance_schema.% | NO      | NO    |> | TRIGGER     | information_schema.% | NO      | NO    |> +-------------+----------------------+---------+-------+> 15 rows in set (0.00 sec)> > +----------------------------------+> | disabled_consumers               |> +----------------------------------+> | events_stages_current            |> | events_stages_history            |> | events_stages_history_long       |> | events_statements_history        |> | events_statements_history_long   |> | events_transactions_history      |> | events_transactions_history_long |> | events_waits_current             |> | events_waits_history             |> | events_waits_history_long        |> +----------------------------------+> 10 rows in set (0.00 sec)> > Empty set (0.00 sec)> > +---------------------------------------------------------------------------------------+-------+> | disabled_instruments                                                                  | timed |> +---------------------------------------------------------------------------------------+-------+> | wait/synch/mutex/sql/TC_LOG_MMAP::LOCK_tc                                             | NO    |> | wait/synch/mutex/sql/LOCK_des_key_file                                                | NO    |> | wait/synch/mutex/sql/MYSQL_BIN_LOG::LOCK_commit                                       | NO    |> ...> | memory/sql/servers_cache                                                              | NO    |> | memory/sql/udf_mem                                                                    | NO    |> | wait/lock/metadata/sql/mdl                                                            | NO    |> +---------------------------------------------------------------------------------------+-------+> 547 rows in set (0.00 sec)> > Query OK, 0 rows affected (0.01 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|READS SQL DATA|
|Deterministic|False|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Language|SQL|
|Created|2021. 04. 10. 15:37:00|
|Last Modified|2021. 04. 10. 15:37:00|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|in_show_instruments|BOOLEAN||1||
|in_show_threads|BOOLEAN||1||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_show_disabled(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Shows all currently disable Performance Schema configuration.

Disabled users is only available for MySQL 5.7.6 and later.
In earlier versions it was only possible to enable users.

Parameters
-----------

in_show_instruments (BOOLEAN):
  Whether to print disabled instruments (can print many items)

in_show_threads (BOOLEAN):
  Whether to print disabled threads

Example
-----------

mysql> CALL sys.ps_setup_show_disabled(TRUE, TRUE);
+----------------------------+
| performance_schema_enabled |
+----------------------------+
|                          1 |
+----------------------------+
1 row in set (0.00 sec)

+--------------------+
| disabled_users     |
+--------------------+
| ''mark''@''localhost'' |
+--------------------+
1 row in set (0.00 sec)

+-------------+----------------------+---------+-------+
| object_type | objects              | enabled | timed |
+-------------+----------------------+---------+-------+
| EVENT       | mysql.%              | NO      | NO    |
| EVENT       | performance_schema.% | NO      | NO    |
| EVENT       | information_schema.% | NO      | NO    |
| FUNCTION    | mysql.%              | NO      | NO    |
| FUNCTION    | performance_schema.% | NO      | NO    |
| FUNCTION    | information_schema.% | NO      | NO    |
| PROCEDURE   | mysql.%              | NO      | NO    |
| PROCEDURE   | performance_schema.% | NO      | NO    |
| PROCEDURE   | information_schema.% | NO      | NO    |
| TABLE       | mysql.%              | NO      | NO    |
| TABLE       | performance_schema.% | NO      | NO    |
| TABLE       | information_schema.% | NO      | NO    |
| TRIGGER     | mysql.%              | NO      | NO    |
| TRIGGER     | performance_schema.% | NO      | NO    |
| TRIGGER     | information_schema.% | NO      | NO    |
+-------------+----------------------+---------+-------+
15 rows in set (0.00 sec)

+----------------------------------+
| disabled_consumers               |
+----------------------------------+
| events_stages_current            |
| events_stages_history            |
| events_stages_history_long       |
| events_statements_history        |
| events_statements_history_long   |
| events_transactions_history      |
| events_transactions_history_long |
| events_waits_current             |
| events_waits_history             |
| events_waits_history_long        |
+----------------------------------+
10 rows in set (0.00 sec)

Empty set (0.00 sec)

+---------------------------------------------------------------------------------------+-------+
| disabled_instruments                                                                  | timed |
+---------------------------------------------------------------------------------------+-------+
| wait/synch/mutex/sql/TC_LOG_MMAP::LOCK_tc                                             | NO    |
| wait/synch/mutex/sql/LOCK_des_key_file                                                | NO    |
| wait/synch/mutex/sql/MYSQL_BIN_LOG::LOCK_commit                                       | NO    |
...
| memory/sql/servers_cache                                                              | NO    |
| memory/sql/udf_mem                                                                    | NO    |
| wait/lock/metadata/sql/mdl                                                            | NO    |
+---------------------------------------------------------------------------------------+-------+
547 rows in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)
'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS disabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'NO'
     ORDER BY disabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'NO'
     ORDER BY object_type, objects;
    SELECT name AS disabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'NO'
     ORDER BY disabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS disabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'NO'
         ORDER BY disabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS disabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'NO'
         ORDER BY disabled_instruments;
    END IF;
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