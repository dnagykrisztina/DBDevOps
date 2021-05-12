[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_show_enabled


# ![logo](../../../../../Images/procedure64.svg) ps_setup_show_enabled

## <a name="#Description"></a>Description
> > Description> -----------> > Shows all currently enabled Performance Schema configuration.> > Parameters> -----------> > in_show_instruments (BOOLEAN):>   Whether to print enabled instruments (can print many items)> > in_show_threads (BOOLEAN):>   Whether to print enabled threads> > Example> -----------> > mysql> CALL sys.ps_setup_show_enabled(TRUE, TRUE);> +----------------------------+> | performance_schema_enabled |> +----------------------------+> |                          1 |> +----------------------------+> 1 row in set (0.00 sec)> > +---------------+> | enabled_users |> +---------------+> | '%'@'%'       |> +---------------+> 1 row in set (0.01 sec)> > +-------------+---------+---------+-------+> | object_type | objects | enabled | timed |> +-------------+---------+---------+-------+> | EVENT       | %.%     | YES     | YES   |> | FUNCTION    | %.%     | YES     | YES   |> | PROCEDURE   | %.%     | YES     | YES   |> | TABLE       | %.%     | YES     | YES   |> | TRIGGER     | %.%     | YES     | YES   |> +-------------+---------+---------+-------+> 5 rows in set (0.01 sec)> > +---------------------------+> | enabled_consumers         |> +---------------------------+> | events_statements_current |> | global_instrumentation    |> | thread_instrumentation    |> | statements_digest         |> +---------------------------+> 4 rows in set (0.05 sec)> > +---------------------------------+-------------+> | enabled_threads                 | thread_type |> +---------------------------------+-------------+> | sql/main                        | BACKGROUND  |> | sql/thread_timer_notifier       | BACKGROUND  |> | innodb/io_ibuf_thread           | BACKGROUND  |> | innodb/io_log_thread            | BACKGROUND  |> | innodb/io_read_thread           | BACKGROUND  |> | innodb/io_read_thread           | BACKGROUND  |> | innodb/io_write_thread          | BACKGROUND  |> | innodb/io_write_thread          | BACKGROUND  |> | innodb/page_cleaner_thread      | BACKGROUND  |> | innodb/srv_lock_timeout_thread  | BACKGROUND  |> | innodb/srv_error_monitor_thread | BACKGROUND  |> | innodb/srv_monitor_thread       | BACKGROUND  |> | innodb/srv_master_thread        | BACKGROUND  |> | innodb/srv_purge_thread         | BACKGROUND  |> | innodb/srv_worker_thread        | BACKGROUND  |> | innodb/srv_worker_thread        | BACKGROUND  |> | innodb/srv_worker_thread        | BACKGROUND  |> | innodb/buf_dump_thread          | BACKGROUND  |> | innodb/dict_stats_thread        | BACKGROUND  |> | sql/signal_handler              | BACKGROUND  |> | sql/compress_gtid_table         | FOREGROUND  |> | root@localhost                  | FOREGROUND  |> +---------------------------------+-------------+> 22 rows in set (0.01 sec)> > +-------------------------------------+-------+> | enabled_instruments                 | timed |> +-------------------------------------+-------+> | wait/io/file/sql/map                | YES   |> | wait/io/file/sql/binlog             | YES   |> ...> | statement/com/Error                 | YES   |> | statement/com/                      | YES   |> | idle                                | YES   |> +-------------------------------------+-------+> 210 rows in set (0.08 sec)> > Query OK, 0 rows affected (0.89 sec)> 
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


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|in_show_instruments|BOOLEAN||1||
|in_show_threads|BOOLEAN||1||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_show_enabled(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Shows all currently enabled Performance Schema configuration.

Parameters
-----------

in_show_instruments (BOOLEAN):
  Whether to print enabled instruments (can print many items)

in_show_threads (BOOLEAN):
  Whether to print enabled threads

Example
-----------

mysql> CALL sys.ps_setup_show_enabled(TRUE, TRUE);
+----------------------------+
| performance_schema_enabled |
+----------------------------+
|                          1 |
+----------------------------+
1 row in set (0.00 sec)

+---------------+
| enabled_users |
+---------------+
| ''%''@''%''       |
+---------------+
1 row in set (0.01 sec)

+-------------+---------+---------+-------+
| object_type | objects | enabled | timed |
+-------------+---------+---------+-------+
| EVENT       | %.%     | YES     | YES   |
| FUNCTION    | %.%     | YES     | YES   |
| PROCEDURE   | %.%     | YES     | YES   |
| TABLE       | %.%     | YES     | YES   |
| TRIGGER     | %.%     | YES     | YES   |
+-------------+---------+---------+-------+
5 rows in set (0.01 sec)

+---------------------------+
| enabled_consumers         |
+---------------------------+
| events_statements_current |
| global_instrumentation    |
| thread_instrumentation    |
| statements_digest         |
+---------------------------+
4 rows in set (0.05 sec)

+---------------------------------+-------------+
| enabled_threads                 | thread_type |
+---------------------------------+-------------+
| sql/main                        | BACKGROUND  |
| sql/thread_timer_notifier       | BACKGROUND  |
| innodb/io_ibuf_thread           | BACKGROUND  |
| innodb/io_log_thread            | BACKGROUND  |
| innodb/io_read_thread           | BACKGROUND  |
| innodb/io_read_thread           | BACKGROUND  |
| innodb/io_write_thread          | BACKGROUND  |
| innodb/io_write_thread          | BACKGROUND  |
| innodb/page_cleaner_thread      | BACKGROUND  |
| innodb/srv_lock_timeout_thread  | BACKGROUND  |
| innodb/srv_error_monitor_thread | BACKGROUND  |
| innodb/srv_monitor_thread       | BACKGROUND  |
| innodb/srv_master_thread        | BACKGROUND  |
| innodb/srv_purge_thread         | BACKGROUND  |
| innodb/srv_worker_thread        | BACKGROUND  |
| innodb/srv_worker_thread        | BACKGROUND  |
| innodb/srv_worker_thread        | BACKGROUND  |
| innodb/buf_dump_thread          | BACKGROUND  |
| innodb/dict_stats_thread        | BACKGROUND  |
| sql/signal_handler              | BACKGROUND  |
| sql/compress_gtid_table         | FOREGROUND  |
| root@localhost                  | FOREGROUND  |
+---------------------------------+-------------+
22 rows in set (0.01 sec)

+-------------------------------------+-------+
| enabled_instruments                 | timed |
+-------------------------------------+-------+
| wait/io/file/sql/map                | YES   |
| wait/io/file/sql/binlog             | YES   |
...
| statement/com/Error                 | YES   |
| statement/com/                      | YES   |
| idle                                | YES   |
+-------------------------------------+-------+
210 rows in set (0.08 sec)

Query OK, 0 rows affected (0.89 sec)
'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS enabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'YES'
     ORDER BY enabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'YES'
     ORDER BY object_type, objects;
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS enabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'YES'
         ORDER BY enabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS enabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'YES'
         ORDER BY enabled_instruments;
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