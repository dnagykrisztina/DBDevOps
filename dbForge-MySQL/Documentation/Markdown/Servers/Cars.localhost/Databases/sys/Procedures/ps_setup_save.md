[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_save


# ![logo](../../../../../Images/procedure64.svg) ps_setup_save

## <a name="#Description"></a>Description
> > Description> -----------> > Saves the current configuration of Performance Schema, > so that you can alter the setup for debugging purposes, > but restore it to a previous state.> > Use the companion procedure - ps_setup_reload_saved(), to > restore the saved config.> > The named lock "sys.ps_setup_save" is taken before the> current configuration is saved. If the attempt to get the named> lock times out, an error occurs.> > The lock is released after the settings have been restored by> calling ps_setup_reload_saved().> > Requires the SUPER privilege for "SET sql_log_bin = 0;".> > Parameters> -----------> > in_timeout INT>   The timeout in seconds used when trying to obtain the lock.>   A negative timeout means infinite timeout.> > Example> -----------> > mysql> CALL sys.ps_setup_save(-1);> Query OK, 0 rows affected (0.08 sec)> > mysql> UPDATE performance_schema.setup_instruments >     ->    SET enabled = 'YES', timed = 'YES';> Query OK, 547 rows affected (0.40 sec)> Rows matched: 784  Changed: 547  Warnings: 0> > /* Run some tests that need more detailed instrumentation here */> > mysql> CALL sys.ps_setup_reload_saved();> Query OK, 0 rows affected (0.32 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|MODIFIES SQL DATA|
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
|in_timeout|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_save(
        IN in_timeout INT
    )
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT '
Description
-----------

Saves the current configuration of Performance Schema, 
so that you can alter the setup for debugging purposes, 
but restore it to a previous state.

Use the companion procedure - ps_setup_reload_saved(), to 
restore the saved config.

The named lock "sys.ps_setup_save" is taken before the
current configuration is saved. If the attempt to get the named
lock times out, an error occurs.

The lock is released after the settings have been restored by
calling ps_setup_reload_saved().

Requires the SUPER privilege for "SET sql_log_bin = 0;".

Parameters
-----------

in_timeout INT
  The timeout in seconds used when trying to obtain the lock.
  A negative timeout means infinite timeout.

Example
-----------

mysql> CALL sys.ps_setup_save(-1);
Query OK, 0 rows affected (0.08 sec)

mysql> UPDATE performance_schema.setup_instruments 
    ->    SET enabled = ''YES'', timed = ''YES'';
Query OK, 547 rows affected (0.40 sec)
Rows matched: 784  Changed: 547  Warnings: 0

/* Run some tests that need more detailed instrumentation here */

mysql> CALL sys.ps_setup_reload_saved();
Query OK, 0 rows affected (0.32 sec)
'
BEGIN
    DECLARE v_lock_result INT;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    SELECT GET_LOCK('sys.ps_setup_save', in_timeout) INTO v_lock_result;
    IF v_lock_result THEN
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_actors;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_consumers;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_instruments;
        DROP TEMPORARY TABLE IF EXISTS tmp_threads;
        CREATE TEMPORARY TABLE tmp_setup_actors SELECT * FROM performance_schema.setup_actors LIMIT 0;
        CREATE TEMPORARY TABLE tmp_setup_consumers LIKE performance_schema.setup_consumers;
        CREATE TEMPORARY TABLE tmp_setup_instruments LIKE performance_schema.setup_instruments;
        CREATE TEMPORARY TABLE tmp_threads (THREAD_ID bigint unsigned NOT NULL PRIMARY KEY, INSTRUMENTED enum('YES','NO') NOT NULL);
        INSERT INTO tmp_setup_actors SELECT * FROM performance_schema.setup_actors;
        INSERT INTO tmp_setup_consumers SELECT * FROM performance_schema.setup_consumers;
        INSERT INTO tmp_setup_instruments SELECT * FROM performance_schema.setup_instruments;
        INSERT INTO tmp_threads SELECT THREAD_ID, INSTRUMENTED FROM performance_schema.threads;
    ELSE
        SIGNAL SQLSTATE VALUE '90000'
           SET MESSAGE_TEXT = 'Could not lock the sys.ps_setup_save user lock, another thread has a saved configuration';
    END IF;
    SET sql_log_bin = @log_bin;
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`2`_
- ![Procedure](../../../../../Images/procedure.svg) [ps_trace_statement_digest](ps_trace_statement_digest.md)
- ![Procedure](../../../../../Images/procedure.svg) [ps_trace_thread](ps_trace_thread.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial