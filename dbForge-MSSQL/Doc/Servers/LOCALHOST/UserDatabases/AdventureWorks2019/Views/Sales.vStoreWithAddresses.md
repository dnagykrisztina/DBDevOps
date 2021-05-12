###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Sales.vStoreWithAddresses


# ![logo](../../../../../Images/view.svg) Sales.vStoreWithAddresses

## <a name="#Description"></a>Description
> Stores (including store addresses) that sell Adventure Works Cycles products to consumers.
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
||Name||
||AddressType||
||AddressLine1||
||AddressLine2||
||City||
||StateProvinceName||
||PostalCode||
||CountryRegionName||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Sales.vStoreWithAddresses AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1] 
    ,a.[AddressLine2] 
    ,a.[City] 
    ,sp.[Name] AS [StateProvinceName] 
    ,a.[PostalCode] 
    ,cr.[Name] AS [CountryRegionName] 
FROM [Sales].[Store] s
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID];
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Stores (including store addresses) that sell Adventure Works Cycles products to consumers.', 'SCHEMA', N'Sales', 'VIEW', N'vStoreWithAddresses'
GO
```

## <a name="#DependsOn"></a>Depends On _`8`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Sales.Store](../Tables/Sales.Store.md)
- [Person.BusinessEntityAddress](../Tables/Person.BusinessEntityAddress.md)
- [Person.Address](../Tables/Person.Address.md)
- [Person.StateProvince](../Tables/Person.StateProvince.md)
- [Person.CountryRegion](../Tables/Person.CountryRegion.md)
- [Person.AddressType](../Tables/Person.AddressType.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial