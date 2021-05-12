###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Functions](../Functions.md)>[Scalar-Valued Functions](ScalarValuedFunctions.md)>dbo.ufnGetProductStandardCost


# ![logo](../../../../../../../Images/scalarfunction.svg) dbo.ufnGetProductStandardCost

## <a name="#Description"></a>Description
> Scalar function returning the standard cost for a given product on a particular order date.
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
|(Result)|money|8||
|@ProductID|int|4|Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid ProductID from the Production.Product table.|
|@OrderDate|datetime|8|Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid order date.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER FUNCTION dbo.ufnGetProductStandardCost(@ProductID [int], @OrderDate [datetime])
RETURNS [money] 
AS 
-- Returns the standard cost for the product on a specific date.
BEGIN
    DECLARE @StandardCost money;

    SELECT @StandardCost = pch.[StandardCost] 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductCostHistory] pch 
        ON p.[ProductID] = pch.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN pch.[StartDate] AND COALESCE(pch.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

    RETURN @StandardCost;
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Scalar function returning the standard cost for a given product on a particular order date.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetProductStandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid ProductID from the Production.Product table.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetProductStandardCost', 'PARAMETER', N'@ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid order date.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetProductStandardCost', 'PARAMETER', N'@OrderDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production.Product](../../../Tables/Production.Product.md)
- [Production.ProductCostHistory](../../../Tables/Production.ProductCostHistory.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial