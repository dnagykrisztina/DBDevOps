###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Types](../Types.md)>[User-Defined Data Types](UserDefinedDataTypes.md)>dbo.Name


# ![logo](../../../../../../../Images/usertype.svg) dbo.Name

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Not Null|False|
|Base Type Name|nvarchar|
|Default||
|Bound Rule||
|Length|50|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TYPE dbo.Name FROM nvarchar(50)
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`40`_
- [HumanResources.Department](../../../Tables/HumanResources.Department.md)
- [HumanResources.Shift](../../../Tables/HumanResources.Shift.md)
- [Person.AddressType](../../../Tables/Person.AddressType.md)
- [Person.ContactType](../../../Tables/Person.ContactType.md)
- [Person.CountryRegion](../../../Tables/Person.CountryRegion.md)
- [Person.Person](../../../Tables/Person.Person.md)
- [Person.PhoneNumberType](../../../Tables/Person.PhoneNumberType.md)
- [Person.StateProvince](../../../Tables/Person.StateProvince.md)
- [Production.Culture](../../../Tables/Production.Culture.md)
- [Production.Location](../../../Tables/Production.Location.md)
- [Production.Product](../../../Tables/Production.Product.md)
- [Production.ProductCategory](../../../Tables/Production.ProductCategory.md)
- [Production.ProductModel](../../../Tables/Production.ProductModel.md)
- [Production.ProductReview](../../../Tables/Production.ProductReview.md)
- [Production.ProductSubcategory](../../../Tables/Production.ProductSubcategory.md)
- [Production.ScrapReason](../../../Tables/Production.ScrapReason.md)
- [Production.UnitMeasure](../../../Tables/Production.UnitMeasure.md)
- [Purchasing.ShipMethod](../../../Tables/Purchasing.ShipMethod.md)
- [Purchasing.Vendor](../../../Tables/Purchasing.Vendor.md)
- [Sales.Currency](../../../Tables/Sales.Currency.md)
- [Sales.SalesReason](../../../Tables/Sales.SalesReason.md)
- [Sales.SalesTaxRate](../../../Tables/Sales.SalesTaxRate.md)
- [Sales.SalesTerritory](../../../Tables/Sales.SalesTerritory.md)
- [Sales.Store](../../../Tables/Sales.Store.md)
- [HumanResources.vEmployee](../../../Views/HumanResources.vEmployee.md)
- [HumanResources.vEmployeeDepartment](../../../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../../../Views/HumanResources.vEmployeeDepartmentHistory.md)
- [Person.vAdditionalContactInfo](../../../Views/Person.vAdditionalContactInfo.md)
- [Person.vStateProvinceCountryRegion](../../../Views/Person.vStateProvinceCountryRegion.md)
- [Production.vProductAndDescription](../../../Views/Production.vProductAndDescription.md)
- [Production.vProductModelCatalogDescription](../../../Views/Production.vProductModelCatalogDescription.md)
- [Production.vProductModelInstructions](../../../Views/Production.vProductModelInstructions.md)
- [Purchasing.vVendorWithAddresses](../../../Views/Purchasing.vVendorWithAddresses.md)
- [Purchasing.vVendorWithContacts](../../../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vIndividualCustomer](../../../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../../../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../../../Views/Sales.vSalesPersonSalesByFiscalYears.md)
- [Sales.vStoreWithAddresses](../../../Views/Sales.vStoreWithAddresses.md)
- [Sales.vStoreWithContacts](../../../Views/Sales.vStoreWithContacts.md)
- [Sales.vStoreWithDemographics](../../../Views/Sales.vStoreWithDemographics.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial