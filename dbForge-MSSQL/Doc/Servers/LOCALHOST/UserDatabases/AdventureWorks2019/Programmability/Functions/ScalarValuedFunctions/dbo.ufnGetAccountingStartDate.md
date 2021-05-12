###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Functions](../Functions.md)>[Scalar-Valued Functions](ScalarValuedFunctions.md)>dbo.ufnGetAccountingStartDate


# ![logo](../../../../../../../Images/scalarfunction.svg) dbo.ufnGetAccountingStartDate

## <a name="#Description"></a>Description
> Scalar function used in the uSalesOrderHeader trigger to set the ending account date.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Null on Null Input|False|
|Schema Bound|False|
|Assembly||


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Description
|---|---|---|---
|(Result)|datetime|8||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER FUNCTION dbo.ufnGetAccountingStartDate()
RETURNS [datetime] 
AS 
BEGIN
    RETURN CONVERT(datetime, '20030701', 112);
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Scalar function used in the uSalesOrderHeader trigger to set the ending account date.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetAccountingStartDate'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.SalesOrderHeader](../../../Tables/Sales.SalesOrderHeader.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial