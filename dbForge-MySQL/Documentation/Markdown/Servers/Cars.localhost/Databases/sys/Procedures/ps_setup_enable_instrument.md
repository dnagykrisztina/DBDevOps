[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_enable_instrument


# ![logo](../../../../../Images/procedure64.svg) ps_setup_enable_instrument

## <a name="#Description"></a>Description
> > Description> -----------> > Enables instruments within Performance Schema > matching the input pattern.> > Parameters> -----------> > in_pattern (VARCHAR(128)):>   A LIKE pattern match (using "%in_pattern%") of events to enable> > Example> -----------> > To enable all mutex instruments:> > mysql> CALL sys.ps_setup_enable_instrument('wait/synch/mutex');> +-------------------------+> | summary                 |> +-------------------------+> | Enabled 155 instruments |> +-------------------------+> 1 row in set (0.02 sec)> > Query OK, 0 rows affected (0.02 sec)> > To enable just a specific TCP/IP based network IO instrument:> > mysql> CALL sys.ps_setup_enable_instrument('wait/io/socket/sql/server_tcpip_socket');> +-----------------------+> | summary               |> +-----------------------+> | Enabled 1 instruments |> +-----------------------+> 1 row in set (0.00 sec)> > Query OK, 0 rows affected (0.00 sec)> > To enable all instruments:> > mysql> CALL sys.ps_setup_enable_instrument('');> +-------------------------+> | summary                 |> +-------------------------+> | Enabled 547 instruments |> +-------------------------+> 1 row in set (0.01 sec)> > Query OK, 0 rows affected (0.01 sec)> 
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
|in_pattern|VARCHAR|128|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_enable_instrument(
        IN in_pattern VARCHAR(128)
    )
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT '
Description
-----------

Enables instruments within Performance Schema 
matching the input pattern.

Parameters
-----------

in_pattern (VARCHAR(128)):
  A LIKE pattern match (using "%in_pattern%") of events to enable

Example
-----------

To enable all mutex instruments:

mysql> CALL sys.ps_setup_enable_instrument(''wait/synch/mutex'');
+-------------------------+
| summary                 |
+-------------------------+
| Enabled 155 instruments |
+-------------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

To enable just a specific TCP/IP based network IO instrument:

mysql> CALL sys.ps_setup_enable_instrument(''wait/io/socket/sql/server_tcpip_socket'');
+-----------------------+
| summary               |
+-----------------------+
| Enabled 1 instruments |
+-----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

To enable all instruments:

mysql> CALL sys.ps_setup_enable_instrument('''');
+-------------------------+
| summary                 |
+-------------------------+
| Enabled 547 instruments |
+-------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
'
BEGIN
    UPDATE performance_schema.setup_instruments
       SET enabled = 'YES', timed = 'YES'
     WHERE name LIKE CONCAT('%', in_pattern, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary;
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