[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Triggers](Triggers.md)>sys_config_insert_set_user


# ![logo](../../../../../Images/trigger64.svg) sys_config_insert_set_user


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Definer|mysql.sys@'localhost'|
|SQL Mode|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|
|Event|INSERT|
|Timing|BEFORE|
|Follows||
|Precedes||
|Created|2021. 04. 10. 15:36:58|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
DEFINER = 'mysql.sys'@'localhost'
TRIGGER sys_config_insert_set_user
	BEFORE INSERT
	ON sys_config
	FOR EACH ROW
BEGIN
    IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN
        SET NEW.set_by = USER();
    END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [sys_config](../Tables/sys_config.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial