[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>table_exists


# ![logo](../../../../../Images/procedure64.svg) table_exists

## <a name="#Description"></a>Description
> > Description> -----------> > Tests whether the table specified in in_db and in_table exists either as a regular> table, or as a temporary table. The returned value corresponds to the table that> will be used, so if there's both a temporary and a permanent table with the given> name, then 'TEMPORARY' will be returned.> > Parameters> -----------> > in_db (VARCHAR(64)):>   The database name to check for the existance of the table in.> > in_table (VARCHAR(64)):>   The name of the table to check the existance of.> > out_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY'):>   The return value: whether the table exists. The value is one of:>     * ''           - the table does not exist neither as a base table, view, nor temporary table.>     * 'BASE TABLE' - the table name exists as a permanent base table table.>     * 'VIEW'       - the table name exists as a view.>     * 'TEMPORARY'  - the table name exists as a temporary table.> > Example> --------> > mysql> CREATE DATABASE db1;> Query OK, 1 row affected (0.07 sec)> > mysql> use db1;> Database changed> mysql> CREATE TABLE t1 (id INT PRIMARY KEY);> Query OK, 0 rows affected (0.08 sec)> > mysql> CREATE TABLE t2 (id INT PRIMARY KEY);> Query OK, 0 rows affected (0.08 sec)> > mysql> CREATE view v_t1 AS SELECT * FROM t1;> Query OK, 0 rows affected (0.00 sec)> > mysql> CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);> Query OK, 0 rows affected (0.00 sec)> > mysql> CALL sys.table_exists('db1', 't1', @exists); SELECT @exists;> Query OK, 0 rows affected (0.00 sec)> > +------------+> | @exists    |> +------------+> | TEMPORARY  |> +------------+> 1 row in set (0.00 sec)> > mysql> CALL sys.table_exists('db1', 't2', @exists); SELECT @exists;> Query OK, 0 rows affected (0.00 sec)> > +------------+> | @exists    |> +------------+> | BASE TABLE |> +------------+> 1 row in set (0.01 sec)> > mysql> CALL sys.table_exists('db1', 'v_t1', @exists); SELECT @exists;> Query OK, 0 rows affected (0.00 sec)> > +---------+> | @exists |> +---------+> | VIEW    |> +---------+> 1 row in set (0.00 sec)> > mysql> CALL sys.table_exists('db1', 't3', @exists); SELECT @exists;> Query OK, 0 rows affected (0.01 sec)> > +---------+> | @exists |> +---------+> |         |> +---------+> 1 row in set (0.00 sec)> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
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
|in_db|VARCHAR|64|||
|in_table|VARCHAR|64|||
|out_exists|ENUM|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE table_exists(
        IN in_db VARCHAR(64), IN in_table VARCHAR(64),
        OUT out_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY')
    )
  SQL SECURITY INVOKER
  COMMENT '
Description
-----------

Tests whether the table specified in in_db and in_table exists either as a regular
table, or as a temporary table. The returned value corresponds to the table that
will be used, so if there''s both a temporary and a permanent table with the given
name, then ''TEMPORARY'' will be returned.

Parameters
-----------

in_db (VARCHAR(64)):
  The database name to check for the existance of the table in.

in_table (VARCHAR(64)):
  The name of the table to check the existance of.

out_exists ENUM('''', ''BASE TABLE'', ''VIEW'', ''TEMPORARY''):
  The return value: whether the table exists. The value is one of:
    * ''''           - the table does not exist neither as a base table, view, nor temporary table.
    * ''BASE TABLE'' - the table name exists as a permanent base table table.
    * ''VIEW''       - the table name exists as a view.
    * ''TEMPORARY''  - the table name exists as a temporary table.

Example
--------

mysql> CREATE DATABASE db1;
Query OK, 1 row affected (0.07 sec)

mysql> use db1;
Database changed
mysql> CREATE TABLE t1 (id INT PRIMARY KEY);
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE t2 (id INT PRIMARY KEY);
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE view v_t1 AS SELECT * FROM t1;
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);
Query OK, 0 rows affected (0.00 sec)

mysql> CALL sys.table_exists(''db1'', ''t1'', @exists); SELECT @exists;
Query OK, 0 rows affected (0.00 sec)

+------------+
| @exists    |
+------------+
| TEMPORARY  |
+------------+
1 row in set (0.00 sec)

mysql> CALL sys.table_exists(''db1'', ''t2'', @exists); SELECT @exists;
Query OK, 0 rows affected (0.00 sec)

+------------+
| @exists    |
+------------+
| BASE TABLE |
+------------+
1 row in set (0.01 sec)

mysql> CALL sys.table_exists(''db1'', ''v_t1'', @exists); SELECT @exists;
Query OK, 0 rows affected (0.00 sec)

+---------+
| @exists |
+---------+
| VIEW    |
+---------+
1 row in set (0.00 sec)

mysql> CALL sys.table_exists(''db1'', ''t3'', @exists); SELECT @exists;
Query OK, 0 rows affected (0.01 sec)

+---------+
| @exists |
+---------+
|         |
+---------+
1 row in set (0.00 sec)
'
BEGIN
    DECLARE v_error BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR 1050 SET v_error = TRUE;
    DECLARE CONTINUE HANDLER FOR 1146 SET v_error = TRUE;
    SET out_exists = '';
    -- Verify whether the table name exists as a normal table
    IF (EXISTS(SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table)) THEN
        -- Unfortunately the only way to determine whether there is also a temporary table is to try to create
        -- a temporary table with the same name. If it succeeds the table didn't exist as a temporary table.
        SET @sys.tmp.table_exists.SQL = CONCAT('CREATE TEMPORARY TABLE `', in_db, '`.`', in_table, '` (id INT PRIMARY KEY)');
        PREPARE stmt_create_table FROM @sys.tmp.table_exists.SQL;
        EXECUTE stmt_create_table;
        DEALLOCATE PREPARE stmt_create_table;
        IF (v_error) THEN
            SET out_exists = 'TEMPORARY';
        ELSE
            -- The temporary table was created, i.e. it didn't exist. Remove it again so we don't leave garbage around.
            SET @sys.tmp.table_exists.SQL = CONCAT('DROP TEMPORARY TABLE `', in_db, '`.`', in_table, '`');
            PREPARE stmt_drop_table FROM @sys.tmp.table_exists.SQL;
            EXECUTE stmt_drop_table;
            DEALLOCATE PREPARE stmt_drop_table;
            SET out_exists = (SELECT TABLE_TYPE FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table);
        END IF;
    ELSE
        -- Check whether a temporary table exists with the same name.
        -- If it does it's possible to SELECT from the table without causing an error.
        -- If it does not exist even a PREPARE using the table will fail.
        SET @sys.tmp.table_exists.SQL = CONCAT('SELECT COUNT(*) FROM `', in_db, '`.`', in_table, '`');
        PREPARE stmt_select FROM @sys.tmp.table_exists.SQL;
        IF (NOT v_error) THEN
            DEALLOCATE PREPARE stmt_select;
            SET out_exists = 'TEMPORARY';
        END IF;
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