###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Sales.vIndividualCustomer


# ![logo](../../../../../Images/view.svg) Sales.vIndividualCustomer

## <a name="#Description"></a>Description
> Individual customers (names and addresses) that purchase Adventure Works Cycles products online.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation|SQL_Latin1_General_CP1_CI_AS|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Schema Bound|False|
|Created|2017. 10. 27. 14:33:14|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Description
|---|---|---
||BusinessEntityID||
||Title||
||FirstName||
||MiddleName||
||LastName||
||Suffix||
||PhoneNumber||
||PhoneNumberType||
||EmailAddress||
||EmailPromotion||
||AddressType||
||AddressLine1||
||AddressLine2||
||City||
||StateProvinceName||
||PostalCode||
||CountryRegionName||
||Demographics||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Sales.vIndividualCustomer 
AS 
SELECT 
    p.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,p.[Demographics]
FROM [Person].[Person] p
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = p.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID]
	INNER JOIN [Sales].[Customer] c
	ON c.[PersonID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID]
WHERE c.StoreID IS NULL;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Individual customers (names and addresses) that purchase Adventure Works Cycles products online.', 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer'
GO
```

## <a name="#DependsOn"></a>Depends On _`14`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)
- [Person.IndividualSurveySchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.IndividualSurveySchemaCollection.md)
- [Person.Person](../Tables/Person.Person.md)
- [Person.BusinessEntityAddress](../Tables/Person.BusinessEntityAddress.md)
- [Person.Address](../Tables/Person.Address.md)
- [Person.StateProvince](../Tables/Person.StateProvince.md)
- [Person.CountryRegion](../Tables/Person.CountryRegion.md)
- [Person.AddressType](../Tables/Person.AddressType.md)
- [Sales.Customer](../Tables/Sales.Customer.md)
- [Person.EmailAddress](../Tables/Person.EmailAddress.md)
- [Person.PersonPhone](../Tables/Person.PersonPhone.md)
- [Person.PhoneNumberType](../Tables/Person.PhoneNumberType.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial