###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Sales.vSalesPersonSalesByFiscalYears


# ![logo](../../../../../Images/view.svg) Sales.vSalesPersonSalesByFiscalYears

## <a name="#Description"></a>Description
> Uses PIVOT to return aggregated sales information for each sales representative.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation|SQL_Latin1_General_CP1_CI_AS|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Schema Bound|False|
|Created|2017. 10. 27. 14:33:15|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Description
|---|---|---
||SalesPersonID||
||FullName||
||JobTitle||
||SalesTerritory||
||2002||
||2003||
||2004||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Sales.vSalesPersonSalesByFiscalYears 
AS 
SELECT 
    pvt.[SalesPersonID]
    ,pvt.[FullName]
    ,pvt.[JobTitle]
    ,pvt.[SalesTerritory]
    ,pvt.[2002]
    ,pvt.[2003]
    ,pvt.[2004] 
FROM (SELECT 
        soh.[SalesPersonID]
        ,p.[FirstName] + ' ' + COALESCE(p.[MiddleName], '') + ' ' + p.[LastName] AS [FullName]
        ,e.[JobTitle]
        ,st.[Name] AS [SalesTerritory]
        ,soh.[SubTotal]
        ,YEAR(DATEADD(m, 6, soh.[OrderDate])) AS [FiscalYear] 
    FROM [Sales].[SalesPerson] sp 
        INNER JOIN [Sales].[SalesOrderHeader] soh 
        ON sp.[BusinessEntityID] = soh.[SalesPersonID]
        INNER JOIN [Sales].[SalesTerritory] st 
        ON sp.[TerritoryID] = st.[TerritoryID] 
        INNER JOIN [HumanResources].[Employee] e 
        ON soh.[SalesPersonID] = e.[BusinessEntityID] 
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] = sp.[BusinessEntityID]
	 ) AS soh 
PIVOT 
(
    SUM([SubTotal]) 
    FOR [FiscalYear] 
    IN ([2002], [2003], [2004])
) AS pvt;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Uses PIVOT to return aggregated sales information for each sales representative.', 'SCHEMA', N'Sales', 'VIEW', N'vSalesPersonSalesByFiscalYears'
GO
```

## <a name="#DependsOn"></a>Depends On _`7`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Sales.SalesTerritory](../Tables/Sales.SalesTerritory.md)
- [Sales.SalesPerson](../Tables/Sales.SalesPerson.md)
- [Sales.SalesOrderHeader](../Tables/Sales.SalesOrderHeader.md)
- [HumanResources.Employee](../Tables/HumanResources.Employee.md)
- [Person.Person](../Tables/Person.Person.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial