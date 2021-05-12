###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Types](../Types.md)>[User-Defined Data Types](UserDefinedDataTypes.md)>dbo.Flag


# ![logo](../../../../../../../Images/usertype.svg) dbo.Flag

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Not Null|True|
|Base Type Name|bit|
|Default||
|Bound Rule||
|Length|1|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TYPE dbo.Flag FROM bit NOT NULL
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`9`_
- [HumanResources.Employee](../../../Tables/HumanResources.Employee.md)
- [Person.StateProvince](../../../Tables/Person.StateProvince.md)
- [Production.Product](../../../Tables/Production.Product.md)
- [Production.ProductProductPhoto](../../../Tables/Production.ProductProductPhoto.md)
- [Purchasing.Vendor](../../../Tables/Purchasing.Vendor.md)
- [Sales.SalesOrderHeader](../../../Tables/Sales.SalesOrderHeader.md)
- [Person.vStateProvinceCountryRegion](../../../Views/Person.vStateProvinceCountryRegion.md)
- [HumanResources.uspUpdateEmployeeHireInfo](../../Procedures/HumanResources.uspUpdateEmployeeHireInfo.md)
- [HumanResources.uspUpdateEmployeeLogin](../../Procedures/HumanResources.uspUpdateEmployeeLogin.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial