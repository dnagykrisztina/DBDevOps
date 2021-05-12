#### 

[Project](../../../../../../index.md) > [localhost](../../../../../index.md) > [User databases](../../../../index.md) > [AdventureWorks2016](../../../index.md) > [Programmability](../../index.md) > [Types](../index.md) > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.Name

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[Name]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | nvarchar |
| Length | 50 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[Name] FROM nvarchar (50) NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[HumanResources].[Department]](../../../Tables/Department.md)
* [[HumanResources].[Shift]](../../../Tables/Shift.md)
* [[Person].[AddressType]](../../../Tables/AddressType.md)
* [[Person].[ContactType]](../../../Tables/ContactType.md)
* [[Person].[CountryRegion]](../../../Tables/CountryRegion.md)
* [[Person].[Person]](../../../Tables/Person.md)
* [[Person].[PhoneNumberType]](../../../Tables/PhoneNumberType.md)
* [[Person].[StateProvince]](../../../Tables/StateProvince.md)
* [[Production].[Culture]](../../../Tables/Culture.md)
* [[Production].[Location]](../../../Tables/Location.md)
* [[Production].[Product]](../../../Tables/Product.md)
* [[Production].[ProductCategory]](../../../Tables/ProductCategory.md)
* [[Production].[ProductModel]](../../../Tables/ProductModel.md)
* [[Production].[ProductReview]](../../../Tables/ProductReview.md)
* [[Production].[ProductSubcategory]](../../../Tables/ProductSubcategory.md)
* [[Production].[ScrapReason]](../../../Tables/ScrapReason.md)
* [[Production].[UnitMeasure]](../../../Tables/UnitMeasure.md)
* [[Purchasing].[ShipMethod]](../../../Tables/ShipMethod.md)
* [[Purchasing].[Vendor]](../../../Tables/Vendor.md)
* [[Sales].[Currency]](../../../Tables/Currency.md)
* [[Sales].[SalesReason]](../../../Tables/SalesReason.md)
* [[Sales].[SalesTaxRate]](../../../Tables/SalesTaxRate.md)
* [[Sales].[SalesTerritory]](../../../Tables/SalesTerritory.md)
* [[Sales].[Store]](../../../Tables/Store.md)
* [[HumanResources].[vEmployee]](../../../Views/vEmployee.md)
* [[HumanResources].[vEmployeeDepartment]](../../../Views/vEmployeeDepartment.md)
* [[HumanResources].[vEmployeeDepartmentHistory]](../../../Views/vEmployeeDepartmentHistory.md)
* [[Person].[vAdditionalContactInfo]](../../../Views/vAdditionalContactInfo.md)
* [[Person].[vStateProvinceCountryRegion]](../../../Views/vStateProvinceCountryRegion.md)
* [[Production].[vProductAndDescription]](../../../Views/vProductAndDescription.md)
* [[Production].[vProductModelCatalogDescription]](../../../Views/vProductModelCatalogDescription.md)
* [[Production].[vProductModelInstructions]](../../../Views/vProductModelInstructions.md)
* [[Purchasing].[vVendorWithAddresses]](../../../Views/vVendorWithAddresses.md)
* [[Purchasing].[vVendorWithContacts]](../../../Views/vVendorWithContacts.md)
* [[Sales].[vIndividualCustomer]](../../../Views/vIndividualCustomer.md)
* [[Sales].[vSalesPerson]](../../../Views/vSalesPerson.md)
* [[Sales].[vSalesPersonSalesByFiscalYears]](../../../Views/vSalesPersonSalesByFiscalYears.md)
* [[Sales].[vStoreWithAddresses]](../../../Views/vStoreWithAddresses.md)
* [[Sales].[vStoreWithContacts]](../../../Views/vStoreWithContacts.md)
* [[Sales].[vStoreWithDemographics]](../../../Views/vStoreWithDemographics.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

