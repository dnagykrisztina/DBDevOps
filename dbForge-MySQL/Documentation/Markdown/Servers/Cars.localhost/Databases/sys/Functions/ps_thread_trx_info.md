[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>ps_thread_trx_info


# ![logo](../../../../../Images/function64.svg) ps_thread_trx_info

## <a name="#Description"></a>Description
> > Description> -----------> > Returns a JSON object with info on the given threads current transaction, > and the statements it has already executed, derived from the> performance_schema.events_transactions_current and> performance_schema.events_statements_history tables (so the consumers > for these also have to be enabled within Performance Schema to get full> data in the object).> > When the output exceeds the default truncation length (65535), a JSON error> object is returned, such as:> > { "error": "Trx info truncated: Row 6 was cut by GROUP_CONCAT()" }> > Similar error objects are returned for other warnings/and exceptions raised> when calling the function.> > The max length of the output of this function can be controlled with the> ps_thread_trx_info.max_length variable set via sys_config, or the> @sys.ps_thread_trx_info.max_length user variable, as appropriate.> > Parameters> -----------> > in_thread_id (BIGINT UNSIGNED):>   The id of the thread to return the transaction info for.> > Example> -----------> > SELECT sys.ps_thread_trx_info(48)\G> *************************** 1. row ***************************> sys.ps_thread_trx_info(48): [>   {>     "time": "790.70 us",>     "state": "COMMITTED",>     "mode": "READ WRITE",>     "autocommitted": "NO",>     "gtid": "AUTOMATIC",>     "isolation": "REPEATABLE READ",>     "statements_executed": [>       {>         "sql_text": "INSERT INTO info VALUES (1, 'foo')",>         "time": "471.02 us",>         "schema": "trx",>         "rows_examined": 0,>         "rows_affected": 1,>         "rows_sent": 0,>         "tmp_tables": 0,>         "tmp_disk_tables": 0,>         "sort_rows": 0,>         "sort_merge_passes": 0>       },>       {>         "sql_text": "COMMIT",>         "time": "254.42 us",>         "schema": "trx",>         "rows_examined": 0,>         "rows_affected": 0,>         "rows_sent": 0,>         "tmp_tables": 0,>         "tmp_disk_tables": 0,>         "sort_rows": 0,>         "sort_merge_passes": 0>       }>     ]>   },>   {>     "time": "426.20 us",>     "state": "COMMITTED",>     "mode": "READ WRITE",>     "autocommitted": "NO",>     "gtid": "AUTOMATIC",>     "isolation": "REPEATABLE READ",>     "statements_executed": [>       {>         "sql_text": "INSERT INTO info VALUES (2, 'bar')",>         "time": "107.33 us",>         "schema": "trx",>         "rows_examined": 0,>         "rows_affected": 1,>         "rows_sent": 0,>         "tmp_tables": 0,>         "tmp_disk_tables": 0,>         "sort_rows": 0,>         "sort_merge_passes": 0>       },>       {>         "sql_text": "COMMIT",>         "time": "213.23 us",>         "schema": "trx",>         "rows_examined": 0,>         "rows_affected": 0,>         "rows_sent": 0,>         "tmp_tables": 0,>         "tmp_disk_tables": 0,>         "sort_rows": 0,>         "sort_merge_passes": 0>       }>     ]>   }> ]> 1 row in set (0.03 sec)> 
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
|(Result)|LONGTEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION ps_thread_trx_info(
        in_thread_id BIGINT UNSIGNED
    )
  RETURNS LONGTEXT CHARSET utf8mb4
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT '
Description
-----------

Returns a JSON object with info on the given threads current transaction, 
and the statements it has already executed, derived from the
performance_schema.events_transactions_current and
performance_schema.events_statements_history tables (so the consumers 
for these also have to be enabled within Performance Schema to get full
data in the object).

When the output exceeds the default truncation length (65535), a JSON error
object is returned, such as:

{ "error": "Trx info truncated: Row 6 was cut by GROUP_CONCAT()" }

Similar error objects are returned for other warnings/and exceptions raised
when calling the function.

The max length of the output of this function can be controlled with the
ps_thread_trx_info.max_length variable set via sys_config, or the
@sys.ps_thread_trx_info.max_length user variable, as appropriate.

Parameters
-----------

in_thread_id (BIGINT UNSIGNED):
  The id of the thread to return the transaction info for.

Example
-----------

SELECT sys.ps_thread_trx_info(48)\\G
*************************** 1. row ***************************
sys.ps_thread_trx_info(48): [
  {
    "time": "790.70 us",
    "state": "COMMITTED",
    "mode": "READ WRITE",
    "autocommitted": "NO",
    "gtid": "AUTOMATIC",
    "isolation": "REPEATABLE READ",
    "statements_executed": [
      {
        "sql_text": "INSERT INTO info VALUES (1, ''foo'')",
        "time": "471.02 us",
        "schema": "trx",
        "rows_examined": 0,
        "rows_affected": 1,
        "rows_sent": 0,
        "tmp_tables": 0,
        "tmp_disk_tables": 0,
        "sort_rows": 0,
        "sort_merge_passes": 0
      },
      {
        "sql_text": "COMMIT",
        "time": "254.42 us",
        "schema": "trx",
        "rows_examined": 0,
        "rows_affected": 0,
        "rows_sent": 0,
        "tmp_tables": 0,
        "tmp_disk_tables": 0,
        "sort_rows": 0,
        "sort_merge_passes": 0
      }
    ]
  },
  {
    "time": "426.20 us",
    "state": "COMMITTED",
    "mode": "READ WRITE",
    "autocommitted": "NO",
    "gtid": "AUTOMATIC",
    "isolation": "REPEATABLE READ",
    "statements_executed": [
      {
        "sql_text": "INSERT INTO info VALUES (2, ''bar'')",
        "time": "107.33 us",
        "schema": "trx",
        "rows_examined": 0,
        "rows_affected": 1,
        "rows_sent": 0,
        "tmp_tables": 0,
        "tmp_disk_tables": 0,
        "sort_rows": 0,
        "sort_merge_passes": 0
      },
      {
        "sql_text": "COMMIT",
        "time": "213.23 us",
        "schema": "trx",
        "rows_examined": 0,
        "rows_affected": 0,
        "rows_sent": 0,
        "tmp_tables": 0,
        "tmp_disk_tables": 0,
        "sort_rows": 0,
        "sort_merge_passes": 0
      }
    ]
  }
]
1 row in set (0.03 sec)
'
BEGIN
    DECLARE v_output LONGTEXT DEFAULT '{}';
    DECLARE v_msg_text TEXT DEFAULT '';
    DECLARE v_signal_msg TEXT DEFAULT '';
    DECLARE v_mysql_errno INT;
    DECLARE v_max_output_len BIGINT;
    -- Capture warnings/errors such as group_concat truncation
    -- and report as JSON error objects
    DECLARE EXIT HANDLER FOR SQLWARNING, SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_msg_text = MESSAGE_TEXT,
            v_mysql_errno = MYSQL_ERRNO;
        IF v_mysql_errno = 1260 THEN
            SET v_signal_msg = CONCAT('{ "error": "Trx info truncated: ', v_msg_text, '" }');
        ELSE
            SET v_signal_msg = CONCAT('{ "error": "', v_msg_text, '" }');
        END IF;
        RETURN v_signal_msg;
    END;
    -- Set configuration options
    IF (@sys.ps_thread_trx_info.max_length IS NULL) THEN
        SET @sys.ps_thread_trx_info.max_length = sys.sys_get_config('ps_thread_trx_info.max_length', 65535);
    END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Function](../../../../../Images/function.svg) [sys_get_config](sys_get_config.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial