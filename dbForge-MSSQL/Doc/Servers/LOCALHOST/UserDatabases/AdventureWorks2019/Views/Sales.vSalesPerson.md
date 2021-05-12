###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Sales.vSalesPerson


# ![logo](../../../../../Images/view.svg) Sales.vSalesPerson

## <a name="#Description"></a>Description
> Sales representiatives (names and addresses) and their sales-related information.
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
||BusinessEntityID||
||Title||
||FirstName||
||MiddleName||
||LastName||
||Suffix||
||JobTitle||
||PhoneNumber||
||PhoneNumberType||
||EmailAddress||
||EmailPromotion||
||AddressLine1||
||AddressLine2||
||City||
||StateProvinceName||
||PostalCode||
||CountryRegionName||
||TerritoryName||
||TerritoryGroup||
||SalesQuota||
||SalesYTD||
||SalesLastYear||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Sales.vSalesPerson 
AS 
SELECT 
    s.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,e.[JobTitle]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,[TerritoryName] = st.[Name]
    ,[TerritoryGroup] = st.[Group]
    ,s.[SalesQuota]
    ,s.[SalesYTD]
    ,s.[SalesLastYear]
FROM [Sales].[SalesPerson] s
    INNER JOIN [HumanResources].[Employee] e 
    ON e.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = s.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Sales].[SalesTerritory] st 
    ON st.[TerritoryID] = s.[TerritoryID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales representiatives (names and addresses) and their sales-related information.', 'SCHEMA', N'Sales', 'VIEW', N'vSalesPerson'
GO
```

## <a name="#DependsOn"></a>Depends On _`14`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)
- [Sales.SalesPerson](../Tables/Sales.SalesPerson.md)
- [HumanResources.Employee](../Tables/HumanResources.Employee.md)
- [Person.Person](../Tables/Person.Person.md)
- [Person.BusinessEntityAddress](../Tables/Person.BusinessEntityAddress.md)
- [Person.Address](../Tables/Person.Address.md)
- [Person.StateProvince](../Tables/Person.StateProvince.md)
- [Person.CountryRegion](../Tables/Person.CountryRegion.md)
- [Sales.SalesTerritory](../Tables/Sales.SalesTerritory.md)
- [Person.EmailAddress](../Tables/Person.EmailAddress.md)
- [Person.PersonPhone](../Tables/Person.PersonPhone.md)
- [Person.PhoneNumberType](../Tables/Person.PhoneNumberType.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial