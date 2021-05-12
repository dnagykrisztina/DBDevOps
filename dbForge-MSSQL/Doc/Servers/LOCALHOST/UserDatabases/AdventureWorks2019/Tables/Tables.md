###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>Tables


# ![logo](../../../../../Images/folder.svg) Tables



## <a name="#Tables"></a>Objects _`72`_
|Name|Description
|---|---
|[dbo.AWBuildVersion](dbo.AWBuildVersion.md)|Current version number of the AdventureWorks 2016 sample database. |
|[dbo.DatabaseLog](dbo.DatabaseLog.md)|Audit table tracking all DDL changes made to the AdventureWorks database. Data is captured by the database trigger ddlDatabaseTriggerLog.|
|[dbo.ErrorLog](dbo.ErrorLog.md)|Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.|
|[HumanResources.Department](HumanResources.Department.md)|Lookup table containing the departments within the Adventure Works Cycles company.|
|[HumanResources.Employee](HumanResources.Employee.md)|Employee information such as salary, department, and title.|
|[HumanResources.EmployeeDepartmentHistory](HumanResources.EmployeeDepartmentHistory.md)|Employee department transfers.|
|[HumanResources.EmployeePayHistory](HumanResources.EmployeePayHistory.md)|Employee pay history.|
|[HumanResources.JobCandidate](HumanResources.JobCandidate.md)|Résumés submitted to Human Resources by job applicants.|
|[HumanResources.Shift](HumanResources.Shift.md)|Work shift lookup table.|
|[Person.Address](Person.Address.md)|Street address information for customers, employees, and vendors.|
|[Person.AddressType](Person.AddressType.md)|Types of addresses stored in the Address table. |
|[Person.BusinessEntity](Person.BusinessEntity.md)|Source of the ID that connects vendors, customers, and employees with address and contact information.|
|[Person.BusinessEntityAddress](Person.BusinessEntityAddress.md)|Cross-reference table mapping customers, vendors, and employees to their addresses.|
|[Person.BusinessEntityContact](Person.BusinessEntityContact.md)|Cross-reference table mapping stores, vendors, and employees to people|
|[Person.ContactType](Person.ContactType.md)|Lookup table containing the types of business entity contacts.|
|[Person.CountryRegion](Person.CountryRegion.md)|Lookup table containing the ISO standard codes for countries and regions.|
|[Person.EmailAddress](Person.EmailAddress.md)|Where to send a person email.|
|[Person.Password](Person.Password.md)|One way hashed authentication information|
|[Person.Person](Person.Person.md)|Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.|
|[Person.PersonPhone](Person.PersonPhone.md)|Telephone number and type of a person.|
|[Person.Pet](Person.Pet.md)||
|[Person.PhoneNumberType](Person.PhoneNumberType.md)|Type of phone number of a person.|
|[Person.StateProvince](Person.StateProvince.md)|State and province lookup table.|
|[Production.BillOfMaterials](Production.BillOfMaterials.md)|Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.|
|[Production.Culture](Production.Culture.md)|Lookup table containing the languages in which some AdventureWorks data is stored.|
|[Production.Document](Production.Document.md)|Product maintenance documents.|
|[Production.Illustration](Production.Illustration.md)|Bicycle assembly diagrams.|
|[Production.Location](Production.Location.md)|Product inventory and manufacturing locations.|
|[Production.Product](Production.Product.md)|Products sold or used in the manfacturing of sold products.|
|[Production.ProductCategory](Production.ProductCategory.md)|High-level product categorization.|
|[Production.ProductCostHistory](Production.ProductCostHistory.md)|Changes in the cost of a product over time.|
|[Production.ProductDescription](Production.ProductDescription.md)|Product descriptions in several languages.|
|[Production.ProductDocument](Production.ProductDocument.md)|Cross-reference table mapping products to related product documents.|
|[Production.ProductInventory](Production.ProductInventory.md)|Product inventory information.|
|[Production.ProductListPriceHistory](Production.ProductListPriceHistory.md)|Changes in the list price of a product over time.|
|[Production.ProductModel](Production.ProductModel.md)|Product model classification.|
|[Production.ProductModelIllustration](Production.ProductModelIllustration.md)|Cross-reference table mapping product models and illustrations.|
|[Production.ProductModelProductDescriptionCulture](Production.ProductModelProductDescriptionCulture.md)|Cross-reference table mapping product descriptions and the language the description is written in.|
|[Production.ProductPhoto](Production.ProductPhoto.md)|Product images.|
|[Production.ProductProductPhoto](Production.ProductProductPhoto.md)|Cross-reference table mapping products and product photos.|
|[Production.ProductReview](Production.ProductReview.md)|Customer reviews of products they have purchased.|
|[Production.ProductSubcategory](Production.ProductSubcategory.md)|Product subcategories. See ProductCategory table.|
|[Production.ScrapReason](Production.ScrapReason.md)|Manufacturing failure reasons lookup table.|
|[Production.TransactionHistory](Production.TransactionHistory.md)|Record of each purchase order, sales order, or work order transaction year to date.|
|[Production.TransactionHistoryArchive](Production.TransactionHistoryArchive.md)|Transactions for previous years.|
|[Production.UnitMeasure](Production.UnitMeasure.md)|Unit of measure lookup table.|
|[Production.WorkOrder](Production.WorkOrder.md)|Manufacturing work orders.|
|[Production.WorkOrderRouting](Production.WorkOrderRouting.md)|Work order details.|
|[Purchasing.ProductVendor](Purchasing.ProductVendor.md)|Cross-reference table mapping vendors with the products they supply.|
|[Purchasing.PurchaseOrderDetail](Purchasing.PurchaseOrderDetail.md)|Individual products associated with a specific purchase order. See PurchaseOrderHeader.|
|[Purchasing.PurchaseOrderHeader](Purchasing.PurchaseOrderHeader.md)|General purchase order information. See PurchaseOrderDetail.|
|[Purchasing.ShipMethod](Purchasing.ShipMethod.md)|Shipping company lookup table.|
|[Purchasing.Vendor](Purchasing.Vendor.md)|Companies from whom Adventure Works Cycles purchases parts or other goods.|
|[Sales.CountryRegionCurrency](Sales.CountryRegionCurrency.md)|Cross-reference table mapping ISO currency codes to a country or region.|
|[Sales.CreditCard](Sales.CreditCard.md)|Customer credit card information.|
|[Sales.Currency](Sales.Currency.md)|Lookup table containing standard ISO currencies.|
|[Sales.CurrencyRate](Sales.CurrencyRate.md)|Currency exchange rates.|
|[Sales.Customer](Sales.Customer.md)|Current customer information. Also see the Person and Store tables.|
|[Sales.PersonCreditCard](Sales.PersonCreditCard.md)|Cross-reference table mapping people to their credit card information in the CreditCard table. |
|[Sales.SalesOrderDetail](Sales.SalesOrderDetail.md)|Individual products associated with a specific sales order. See SalesOrderHeader.|
|[Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)|General sales order information.|
|[Sales.SalesOrderHeaderSalesReason](Sales.SalesOrderHeaderSalesReason.md)|Cross-reference table mapping sales orders to sales reason codes.|
|[Sales.SalesPerson](Sales.SalesPerson.md)|Sales representative current information.|
|[Sales.SalesPersonQuotaHistory](Sales.SalesPersonQuotaHistory.md)|Sales performance tracking.|
|[Sales.SalesReason](Sales.SalesReason.md)|Lookup table of customer purchase reasons.|
|[Sales.SalesTaxRate](Sales.SalesTaxRate.md)|Tax rate lookup table.|
|[Sales.SalesTerritory](Sales.SalesTerritory.md)|Sales territory lookup table.|
|[Sales.SalesTerritoryHistory](Sales.SalesTerritoryHistory.md)|Sales representative transfers to other sales territories.|
|[Sales.ShoppingCartItem](Sales.ShoppingCartItem.md)|Contains online customer orders until the order is submitted or cancelled.|
|[Sales.SpecialOffer](Sales.SpecialOffer.md)|Sale discounts lookup table.|
|[Sales.SpecialOfferProduct](Sales.SpecialOfferProduct.md)|Cross-reference table mapping products to special offer discounts.|
|[Sales.Store](Sales.Store.md)|Customers (resellers) of Adventure Works products.|

___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial