###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Sales.vStoreWithContacts


# ![logo](../../../../../Images/view.svg) Sales.vStoreWithContacts

## <a name="#Description"></a>Description
> Stores (including store contacts) that sell Adventure Works Cycles products to consumers.
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
||ContactType||
||Title||
||FirstName||
||MiddleName||
||LastName||
||Suffix||
||PhoneNumber||
||PhoneNumberType||
||EmailAddress||
||EmailPromotion||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Sales.vStoreWithContacts AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,ct.[Name] AS [ContactType] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,pp.[PhoneNumber] 
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress] 
    ,p.[EmailPromotion] 
FROM [Sales].[Store] s
    INNER JOIN [Person].[BusinessEntityContact] bec 
    ON bec.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[ContactType] ct
	ON ct.[ContactTypeID] = bec.[ContactTypeID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = bec.[PersonID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Stores (including store contacts) that sell Adventure Works Cycles products to consumers.', 'SCHEMA', N'Sales', 'VIEW', N'vStoreWithContacts'
GO
```

## <a name="#DependsOn"></a>Depends On _`10`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)
- [Sales.Store](../Tables/Sales.Store.md)
- [Person.BusinessEntityContact](../Tables/Person.BusinessEntityContact.md)
- [Person.ContactType](../Tables/Person.ContactType.md)
- [Person.Person](../Tables/Person.Person.md)
- [Person.EmailAddress](../Tables/Person.EmailAddress.md)
- [Person.PersonPhone](../Tables/Person.PersonPhone.md)
- [Person.PhoneNumberType](../Tables/Person.PhoneNumberType.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial