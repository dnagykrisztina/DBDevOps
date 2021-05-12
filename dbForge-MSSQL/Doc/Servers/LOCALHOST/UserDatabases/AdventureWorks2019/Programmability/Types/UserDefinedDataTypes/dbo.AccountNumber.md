###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Types](../Types.md)>[User-Defined Data Types](UserDefinedDataTypes.md)>dbo.AccountNumber


# ![logo](../../../../../../../Images/usertype.svg) dbo.AccountNumber

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Not Null|False|
|Base Type Name|nvarchar|
|Default||
|Bound Rule||
|Length|15|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TYPE dbo.AccountNumber FROM nvarchar(15)
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`2`_
- [Purchasing.Vendor](../../../Tables/Purchasing.Vendor.md)
- [Sales.SalesOrderHeader](../../../Tables/Sales.SalesOrderHeader.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial