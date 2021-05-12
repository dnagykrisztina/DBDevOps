###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Functions](../Functions.md)>[Scalar-Valued Functions](ScalarValuedFunctions.md)>dbo.ufnLeadingZeros


# ![logo](../../../../../../../Images/scalarfunction.svg) dbo.ufnLeadingZeros

## <a name="#Description"></a>Description
> Scalar function used by the Sales.Customer table to help set the account number.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Null on Null Input|False|
|Schema Bound|True|
|Assembly||


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Description
|---|---|---|---
|(Result)|varchar|8||
|@Value|int|4|Input parameter for the scalar function ufnLeadingZeros. Enter a valid integer.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER FUNCTION dbo.ufnLeadingZeros(
    @Value int
) 
RETURNS varchar(8) 
WITH SCHEMABINDING 
AS 
BEGIN
    DECLARE @ReturnValue varchar(8);

    SET @ReturnValue = CONVERT(varchar(8), @Value);
    SET @ReturnValue = REPLICATE('0', 8 - DATALENGTH(@ReturnValue)) + @ReturnValue;

    RETURN (@ReturnValue);
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Scalar function used by the Sales.Customer table to help set the account number.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnLeadingZeros'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the scalar function ufnLeadingZeros. Enter a valid integer.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnLeadingZeros', 'PARAMETER', N'@Value'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.Customer](../../../Tables/Sales.Customer.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial