###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Types](../Types.md)>[User-Defined Data Types](UserDefinedDataTypes.md)>dbo.Phone


# ![logo](../../../../../../../Images/usertype.svg) dbo.Phone

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Not Null|False|
|Base Type Name|nvarchar|
|Default||
|Bound Rule||
|Length|25|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TYPE dbo.Phone FROM nvarchar(25)
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`6`_
- [Person.PersonPhone](../../../Tables/Person.PersonPhone.md)
- [HumanResources.vEmployee](../../../Views/HumanResources.vEmployee.md)
- [Purchasing.vVendorWithContacts](../../../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vIndividualCustomer](../../../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../../../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithContacts](../../../Views/Sales.vStoreWithContacts.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial