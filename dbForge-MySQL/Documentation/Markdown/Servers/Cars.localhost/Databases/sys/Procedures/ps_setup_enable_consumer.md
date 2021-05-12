[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Procedures](Procedures.md)>ps_setup_enable_consumer


# ![logo](../../../../../Images/procedure64.svg) ps_setup_enable_consumer

## <a name="#Description"></a>Description
> > Description> -----------> > Enables consumers within Performance Schema > matching the input pattern.> > Parameters> -----------> > consumer (VARCHAR(128)):>   A LIKE pattern match (using "%consumer%") of consumers to enable> > Example> -----------> > To enable all consumers:> > mysql> CALL sys.ps_setup_enable_consumer('');> +-------------------------+> | summary                 |> +-------------------------+> | Enabled 10 consumers    |> +-------------------------+> 1 row in set (0.02 sec)> > Query OK, 0 rows affected (0.02 sec)> > To enable just "waits" consumers:> > mysql> CALL sys.ps_setup_enable_consumer('waits');> +-----------------------+> | summary               |> +-----------------------+> | Enabled 3 consumers   |> +-----------------------+> 1 row in set (0.00 sec)> > Query OK, 0 rows affected (0.00 sec)> 
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
|consumer|VARCHAR|128|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE PROCEDURE ps_setup_enable_consumer(
        IN consumer VARCHAR(128)
    )
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT '
Description
-----------

Enables consumers within Performance Schema 
matching the input pattern.

Parameters
-----------

consumer (VARCHAR(128)):
  A LIKE pattern match (using "%consumer%") of consumers to enable

Example
-----------

To enable all consumers:

mysql> CALL sys.ps_setup_enable_consumer('''');
+-------------------------+
| summary                 |
+-------------------------+
| Enabled 10 consumers    |
+-------------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

To enable just "waits" consumers:

mysql> CALL sys.ps_setup_enable_consumer(''waits'');
+-----------------------+
| summary               |
+-----------------------+
| Enabled 3 consumers   |
+-----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
'
BEGIN
    UPDATE performance_schema.setup_consumers
       SET enabled = 'YES'
     WHERE name LIKE CONCAT('%', consumer, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary;
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