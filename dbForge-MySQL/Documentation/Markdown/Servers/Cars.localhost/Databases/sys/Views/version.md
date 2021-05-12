[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[sys](../sys.md)>[Views](Views.md)>version


# ![logo](../../../../../Images/view64.svg) version


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|With Check Option|NONE|
|Security|Invoker|
|Definer|mysql.sys@'localhost'|
|ANSI Quotes|False|


## <a name="#Columns"></a>Columns
|Name|Data Type|Length|Unsigned|Zerofill|Binary|Not Null|
|---|---|---|---|---|---|---|
|sys_version|VARCHAR|5|False|False|False|True|
|mysql_version|VARCHAR|6|False|False|False|True|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE 
	DEFINER = 'mysql.sys'@'localhost'
	SQL SECURITY INVOKER
VIEW version
AS
	SELECT
	  '2.1.1' AS `sys_version`,
	  VERSION() AS `mysql_version`;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial