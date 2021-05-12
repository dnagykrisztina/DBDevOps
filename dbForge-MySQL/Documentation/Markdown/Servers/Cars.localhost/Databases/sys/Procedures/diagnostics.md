[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>diagnostics


# ![logo](../../../../../Images/procedure64.svg) diagnostics

## <a name="#Description"></a>Description
> > Description> -----------> > Create a report of the current status of the server for diagnostics purposes. Data collected includes (some items depends on versions and settings):> >    * The GLOBAL VARIABLES>    * Several sys schema views including metrics or equivalent (depending on version and settings)>    * Queries in the 95th percentile>    * Several ndbinfo views for MySQL Cluster>    * Replication (both master and slave) information.> > Some of the sys schema views are calculated as initial (optional), overall, delta:> >    * The initial view is the content of the view at the start of this procedure.>      This output will be the same as the the start values used for the delta view.>      The initial view is included if @sys.diagnostics.include_raw = 'ON'.>    * The overall view is the content of the view at the end of this procedure.>      This output is the same as the end values used for the delta view.>      The overall view is always included.>    * The delta view is the difference from the beginning to the end. Note that for min and max values>      they are simply the min or max value from the end view respectively, so does not necessarily reflect>      the minimum/maximum value in the monitored period.>      Note: except for the metrics views the delta is only calculation between the first and last outputs.> > Requires the SUPER privilege for "SET sql_log_bin = 0;".> > Parameters> -----------> > in_max_runtime (INT UNSIGNED):>   The maximum time to keep collecting data.>   Use NULL to get the default which is 60 seconds, otherwise enter a value greater than 0.> in_interval (INT UNSIGNED):>   How long to sleep between data collections.>   Use NULL to get the default which is 30 seconds, otherwise enter a value greater than 0.> in_auto_config (ENUM('current', 'medium', 'full'))>   Automatically enable Performance Schema instruments and consumers.>   NOTE: The more that are enabled, the more impact on the performance.>   Supported values are:>      * current - use the current settings.>      * medium - enable some settings. This requires the SUPER privilege.>      * full - enables all settings. This will have a big impact on the>               performance - be careful using this option. This requires>               the SUPER privilege.>   If another setting the 'current' is chosen, the current settings>   are restored at the end of the procedure.> > > Configuration Options> ----------------------> > sys.diagnostics.allow_i_s_tables>   Specifies whether it is allowed to do table scan queries on information_schema.TABLES. This can be expensive if there>   are many tables. Set to 'ON' to allow, 'OFF' to not allow.>   Default is 'OFF'.> > sys.diagnostics.include_raw>   Set to 'ON' to include the raw data (e.g. the original output of "SELECT * FROM sys.metrics").>   Use this to get the initial values of the various views.>   Default is 'OFF'.> > sys.statement_truncate_len>   How much of queries in the process list output to include.>   Default is 64.> > sys.debug>   Whether to provide debugging output.>   Default is 'OFF'. Set to 'ON' to include.> > > Example> --------> > To create a report and append it to the file diag.out:> > mysql> TEE diag.out;> mysql> CALL sys.diagnostics(120, 30, 'current');> ...> mysql> NOTEE;> 
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
|in_max_runtime|INT||11||
|in_interval|INT||11||
|in_auto_config|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE diagnostics(
        IN in_max_runtime int unsigned, IN in_interval int unsigned,
        IN in_auto_config enum ('current', 'medium', 'full')
    )
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Create a report of the current status of the server for diagnostics purposes. Data collected includes (some items depends on versions and settings):

   * The GLOBAL VARIABLES
   * Several sys schema views including metrics or equivalent (depending on version and settings)
   * Queries in the 95th percentile
   * Several ndbinfo views for MySQL Cluster
   * Replication (both master and slave) information.

Some of the sys schema views are calculated as initial (optional), overall, delta:

   * The initial view is the content of the view at the start of this procedure.
     This output will be the same as the the start values used for the delta view.
     The initial view is included if @sys.diagnostics.include_raw = ''ON''.
   * The overall view is the content of the view at the end of this procedure.
     This output is the same as the end values used for the delta view.
     The overall view is always included.
   * The delta view is the difference from the beginning to the end. Note that for min and max values
     they are simply the min or max value from the end view respectively, so does not necessarily reflect
     the minimum/maximum value in the monitored period.
     Note: except for the metrics views the delta is only calculation between the first and last outputs.

Requires the SUPER privilege for "SET sql_log_bin = 0;".

Parameters
-----------

in_max_runtime (INT UNSIGNED):
  The maximum time to keep collecting data.
  Use NULL to get the default which is 60 seconds, otherwise enter a value greater than 0.
in_interval (INT UNSIGNED):
  How long to sleep between data collections.
  Use NULL to get the default which is 30 seconds, otherwise enter a value greater than 0.
in_auto_config (ENUM(''current'', ''medium'', ''full''))
  Automatically enable Performance Schema instruments and consumers.
  NOTE: The more that are enabled, the more impact on the performance.
  Supported values are:
     * current - use the current settings.
     * medium - enable some settings. This requires the SUPER privilege.
     * full - enables all settings. This will have a big impact on the
              performance - be careful using this option. This requires
              the SUPER privilege.
  If another setting the ''current'' is chosen, the current settings
  are restored at the end of the procedure.


Configuration Options
----------------------

sys.diagnostics.allow_i_s_tables
  Specifies whether it is allowed to do table scan queries on information_schema.TABLES. This can be expensive if there
  are many tables. Set to ''ON'' to allow, ''OFF'' to not allow.
  Default is ''OFF''.

sys.diagnostics.include_raw
  Set to ''ON'' to include the raw data (e.g. the original output of "SELECT * FROM sys.metrics").
  Use this to get the initial values of the various views.
  Default is ''OFF''.

sys.statement_truncate_len
  How much of queries in the process list output to include.
  Default is 64.

sys.debug
  Whether to provide debugging output.
  Default is ''OFF''. Set to ''ON'' to include.


Example
--------

To create a report and append it to the file diag.out:

mysql> TEE diag.out;
mysql> CALL sys.diagnostics(120, 30, ''current'');
...
mysql> NOTEE;
'
BEGIN
    DECLARE v_start, v_runtime, v_iter_start, v_sleep DECIMAL(20,2) DEFAULT 0.0;
    DECLARE v_has_innodb, v_has_ndb, v_has_ps, v_has_replication, v_has_ps_replication VARCHAR(8) CHARSET utf8mb4 DEFAULT 'NO';
    DECLARE v_this_thread_enabled  ENUM('YES', 'NO');
    DECLARE v_table_name, v_banner VARCHAR(64) CHARSET utf8mb4;
    DECLARE v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from, v_no_delta_names TEXT;
    DECLARE v_output_time, v_output_time_prev DECIMAL(20,3) UNSIGNED;
    DECLARE v_output_count, v_count, v_old_group_concat_max_len INT UNSIGNED DEFAULT 0;
    -- The width of each of the status outputs in the summery
    DECLARE v_status_summary_width TINYINT UNSIGNED DEFAULT 50;
    DECLARE v_done BOOLEAN DEFAULT FALSE;
    -- Do not include the following ndbinfo views:
    --    'blocks'                    Static
    --    'config_params'             Static
    --    'dict_obj_types'            Static
    --    'disk_write_speed_base'     Can generate lots of output - only include aggregate views here
    --    'memory_per_fragment'       Can generate lots of output
    --    'memoryusage'               Handled separately
    --    'operations_per_fragment'   Can generate lots of output
    --    'threadblocks'              Only needed once
    DECLARE c_ndbinfo CURSOR FOR
        SELECT TABLE_NAME
          FROM information_schema.TABLES
         WHERE TABLE_SCHEMA = 'ndbinfo'
               AND TABLE_NAME NOT IN (
                  'blocks',
                  'config_params',
                  'dict_obj_types',
                  'disk_write_speed_base',
                  'memory_per_fragment',
                  'memoryusage',
                  'operations_per_fragment',
                  'threadblocks'
               );
    DECLARE c_sysviews_w_delta CURSOR FOR
        SELECT table_name
          FROM tmp_sys_views_delta
         ORDER BY table_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    -- Do not track the current thread - no reason to clutter the output
    SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    END IF;
    -- Check options are sane
    IF (in_max_runtime < in_interval) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than or equal to in_interval';
    END IF;
    IF (in_max_runtime = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than 0';
    END IF;
    IF (in_interval = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_interval must be greater than 0';
    END IF;
    -- Set configuration options
    IF (@sys.diagnostics.allow_i_s_tables IS NULL) THEN
        SET @sys.diagnostics.allow_i_s_tables = sys.sys_get_config('diagnostics.allow_i_s_tables', 'OFF');
    END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Procedure](../../../../../Images/procedure.svg) [ps_setup_disable_thread](ps_setup_disable_thread.md)
- ![Function](../../../../../Images/function.svg) [sys_get_config](../Functions/sys_get_config.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial