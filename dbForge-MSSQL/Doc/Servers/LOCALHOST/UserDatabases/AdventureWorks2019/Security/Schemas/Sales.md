###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Security](../Security.md)>[Schemas](Schemas.md)>Sales


# ![logo](../../../../../../Images/schema.svg) Sales

## <a name="#Description"></a>Description
> Contains objects related to customers, sales orders, and sales territories.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SCHEMA Sales AUTHORIZATION dbo
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to customers, sales orders, and sales territories.', 'SCHEMA', N'Sales'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`27`_
- [Sales.CountryRegionCurrency](../../Tables/Sales.CountryRegionCurrency.md)
- [Sales.CreditCard](../../Tables/Sales.CreditCard.md)
- [Sales.Currency](../../Tables/Sales.Currency.md)
- [Sales.CurrencyRate](../../Tables/Sales.CurrencyRate.md)
- [Sales.Customer](../../Tables/Sales.Customer.md)
- [Sales.PersonCreditCard](../../Tables/Sales.PersonCreditCard.md)
- [Sales.SalesOrderDetail](../../Tables/Sales.SalesOrderDetail.md)
- [Sales.SalesOrderHeader](../../Tables/Sales.SalesOrderHeader.md)
- [Sales.SalesOrderHeaderSalesReason](../../Tables/Sales.SalesOrderHeaderSalesReason.md)
- [Sales.SalesPerson](../../Tables/Sales.SalesPerson.md)
- [Sales.SalesPersonQuotaHistory](../../Tables/Sales.SalesPersonQuotaHistory.md)
- [Sales.SalesReason](../../Tables/Sales.SalesReason.md)
- [Sales.SalesTaxRate](../../Tables/Sales.SalesTaxRate.md)
- [Sales.SalesTerritory](../../Tables/Sales.SalesTerritory.md)
- [Sales.SalesTerritoryHistory](../../Tables/Sales.SalesTerritoryHistory.md)
- [Sales.ShoppingCartItem](../../Tables/Sales.ShoppingCartItem.md)
- [Sales.SpecialOffer](../../Tables/Sales.SpecialOffer.md)
- [Sales.SpecialOfferProduct](../../Tables/Sales.SpecialOfferProduct.md)
- [Sales.Store](../../Tables/Sales.Store.md)
- [Sales.vIndividualCustomer](../../Views/Sales.vIndividualCustomer.md)
- [Sales.vPersonDemographics](../../Views/Sales.vPersonDemographics.md)
- [Sales.vSalesPerson](../../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../../Views/Sales.vSalesPersonSalesByFiscalYears.md)
- [Sales.vStoreWithAddresses](../../Views/Sales.vStoreWithAddresses.md)
- [Sales.vStoreWithContacts](../../Views/Sales.vStoreWithContacts.md)
- [Sales.vStoreWithDemographics](../../Views/Sales.vStoreWithDemographics.md)
- [Sales.StoreSurveySchemaCollection](../../Programmability/Types/XmlSchemaCollection/Sales.StoreSurveySchemaCollection.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial