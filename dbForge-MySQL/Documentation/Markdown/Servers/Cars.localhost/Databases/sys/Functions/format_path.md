[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Functions](Functions.md)>format_path


# ![logo](../../../../../Images/function64.svg) format_path

## <a name="#Description"></a>Description
> > Description> -----------> > Takes a raw path value, and strips out the datadir or tmpdir> replacing with @@datadir and @@tmpdir respectively.> > Also normalizes the paths across operating systems, so backslashes> on Windows are converted to forward slashes> > Parameters> -----------> > path (VARCHAR(512)):>   The raw file path value to format.> > Returns> -----------> > VARCHAR(512) CHARSET UTF8MB4> > Example> -----------> > mysql> select @@datadir;> +-----------------------------------------------+> | @@datadir                                     |> +-----------------------------------------------+> | /Users/mark/sandboxes/SmallTree/AMaster/data/ |> +-----------------------------------------------+> 1 row in set (0.06 sec)> > mysql> select format_path('/Users/mark/sandboxes/SmallTree/AMaster/data/mysql/proc.MYD') AS path;> +--------------------------+> | path                     |> +--------------------------+> | @@datadir/mysql/proc.MYD |> +--------------------------+> 1 row in set (0.03 sec)> 
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
|in_path|VARCHAR|512|||
|(Result)|VARCHAR|512|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FUNCTION format_path(
        in_path VARCHAR(512)
    )
  RETURNS VARCHAR(512) CHARSET utf8mb4
  DETERMINISTIC
  SQL SECURITY INVOKER
  NO SQL
  COMMENT '
Description
-----------

Takes a raw path value, and strips out the datadir or tmpdir
replacing with @@datadir and @@tmpdir respectively.

Also normalizes the paths across operating systems, so backslashes
on Windows are converted to forward slashes

Parameters
-----------

path (VARCHAR(512)):
  The raw file path value to format.

Returns
-----------

VARCHAR(512) CHARSET UTF8MB4

Example
-----------

mysql> select @@datadir;
+-----------------------------------------------+
| @@datadir                                     |
+-----------------------------------------------+
| /Users/mark/sandboxes/SmallTree/AMaster/data/ |
+-----------------------------------------------+
1 row in set (0.06 sec)

mysql> select format_path(''/Users/mark/sandboxes/SmallTree/AMaster/data/mysql/proc.MYD'') AS path;
+--------------------------+
| path                     |
+--------------------------+
| @@datadir/mysql/proc.MYD |
+--------------------------+
1 row in set (0.03 sec)
'
BEGIN
  DECLARE v_path VARCHAR(512);
  DECLARE v_undo_dir VARCHAR(1024);
  DECLARE path_separator CHAR(1) DEFAULT '/';
  IF @@global.version_compile_os LIKE 'win%' THEN
    SET path_separator = '\\';
  END IF;
  -- OSX hides /private/ in variables, but Performance Schema does not
  IF in_path LIKE '/private/%' THEN
    SET v_path = REPLACE(in_path, '/private', '');
  ELSE
    SET v_path = in_path;
  END IF;
  -- @@global.innodb_undo_directory is only set when separate undo logs are used
  SET v_undo_dir = IFNULL((SELECT VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'innodb_undo_directory'), '');
  IF v_path IS NULL THEN
    RETURN NULL;
  ELSEIF v_path LIKE CONCAT(@@global.datadir, IF(SUBSTRING(@@global.datadir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.datadir, CONCAT('@@datadir', IF(SUBSTRING(@@global.datadir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.tmpdir, IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.tmpdir, CONCAT('@@tmpdir', IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.slave_load_tmpdir, IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.slave_load_tmpdir, CONCAT('@@slave_load_tmpdir', IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_data_home_dir, IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_data_home_dir, CONCAT('@@innodb_data_home_dir', IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_log_group_home_dir, IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_log_group_home_dir, CONCAT('@@innodb_log_group_home_dir', IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(v_undo_dir, IF(SUBSTRING(v_undo_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, v_undo_dir, CONCAT('@@innodb_undo_directory', IF(SUBSTRING(v_undo_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.basedir, IF(SUBSTRING(@@global.basedir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.basedir, CONCAT('@@basedir', IF(SUBSTRING(@@global.basedir, -1) = path_separator, path_separator, '')));
  END IF;
  RETURN v_path;
END
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`3`_
- ![View](../../../../../Images/view.svg) [io_global_by_file_by_bytes](../Views/io_global_by_file_by_bytes.md)
- ![View](../../../../../Images/view.svg) [io_global_by_file_by_latency](../Views/io_global_by_file_by_latency.md)
- ![View](../../../../../Images/view.svg) [latest_file_io](../Views/latest_file_io.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial