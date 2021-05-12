###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Security](../Security.md)>[Schemas](Schemas.md)>Purchasing


# ![logo](../../../../../../Images/schema.svg) Purchasing

## <a name="#Description"></a>Description
> Contains objects related to vendors and purchase orders.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SCHEMA Purchasing AUTHORIZATION dbo
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to vendors and purchase orders.', 'SCHEMA', N'Purchasing'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`7`_
- [Purchasing.ProductVendor](../../Tables/Purchasing.ProductVendor.md)
- [Purchasing.PurchaseOrderDetail](../../Tables/Purchasing.PurchaseOrderDetail.md)
- [Purchasing.PurchaseOrderHeader](../../Tables/Purchasing.PurchaseOrderHeader.md)
- [Purchasing.ShipMethod](../../Tables/Purchasing.ShipMethod.md)
- [Purchasing.Vendor](../../Tables/Purchasing.Vendor.md)
- [Purchasing.vVendorWithAddresses](../../Views/Purchasing.vVendorWithAddresses.md)
- [Purchasing.vVendorWithContacts](../../Views/Purchasing.vVendorWithContacts.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial