#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Sales.vSalesPersonSalesByFiscalYears

# ![Views](../../../../Images/View32.png) [Sales].[vSalesPersonSalesByFiscalYears]

---

## <a name="#description"></a>MS_Description

Uses PIVOT to return aggregated sales information for each sales representative.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:24:52 2017. október 19., csütörtök |
| Last Modified | 17:29:01 2021. március 21., vasárnap |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| SalesPersonID | int | 4 |
| FullName | nvarchar(152) | 304 |
| JobTitle | nvarchar(50) | 100 |
| SalesTerritory | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| 2002 | money | 8 |
| 2003 | money | 8 |
| 2004 | money | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Sales].[vSalesPersonSalesByFiscalYears] 
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
EXEC sp_addextendedproperty N'MS_Description', N'Uses PIVOT to return aggregated sales information for each sales representative.', 'SCHEMA', N'Sales', 'VIEW', N'vSalesPersonSalesByFiscalYears', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[Employee]](../Tables/Employee.md)
* [[Person].[Person]](../Tables/Person.md)
* [[Sales].[SalesOrderHeader]](../Tables/SalesOrderHeader.md)
* [[Sales].[SalesPerson]](../Tables/SalesPerson.md)
* [[Sales].[SalesTerritory]](../Tables/SalesTerritory.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Sales](../Security/Schemas/Sales.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

