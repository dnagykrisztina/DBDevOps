###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Security](../../Security.md)>[Roles](../Roles.md)>[Database Roles](DatabaseRoles.md)>db_owner


# ![logo](../../../../../../../Images/DatabaseRole.svg) db_owner


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#Members"></a>Members _`1`_
dbo


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE ROLE db_owner
GO

EXEC sp_addrolemember N'db_owner', N'dbo'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`1`_
- [db_owner](../../Schemas/db_owner.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial