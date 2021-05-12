###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>HumanResources.vEmployee


# ![logo](../../../../../Images/view.svg) HumanResources.vEmployee

## <a name="#Description"></a>Description
> Employee names and addresses.
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
||AdditionalContactInfo||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW HumanResources.vEmployee 
AS 
SELECT 
    e.[BusinessEntityID]
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
    ,sp.[Name] AS [StateProvinceName] 
    ,a.[PostalCode]
    ,cr.[Name] AS [CountryRegionName] 
    ,p.[AdditionalContactInfo]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = e.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Person].[PersonPhone] pp
    ON pp.BusinessEntityID = p.[BusinessEntityID]
    LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
    ON pp.[PhoneNumberTypeID] = pnt.[PhoneNumberTypeID]
    LEFT OUTER JOIN [Person].[EmailAddress] ea
    ON p.[BusinessEntityID] = ea.[BusinessEntityID];
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee names and addresses.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee'
GO
```

## <a name="#DependsOn"></a>Depends On _`13`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)
- [Person.AdditionalContactInfoSchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.AdditionalContactInfoSchemaCollection.md)
- [HumanResources.Employee](../Tables/HumanResources.Employee.md)
- [Person.Person](../Tables/Person.Person.md)
- [Person.BusinessEntityAddress](../Tables/Person.BusinessEntityAddress.md)
- [Person.Address](../Tables/Person.Address.md)
- [Person.StateProvince](../Tables/Person.StateProvince.md)
- [Person.CountryRegion](../Tables/Person.CountryRegion.md)
- [Person.PersonPhone](../Tables/Person.PersonPhone.md)
- [Person.PhoneNumberType](../Tables/Person.PhoneNumberType.md)
- [Person.EmailAddress](../Tables/Person.EmailAddress.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial