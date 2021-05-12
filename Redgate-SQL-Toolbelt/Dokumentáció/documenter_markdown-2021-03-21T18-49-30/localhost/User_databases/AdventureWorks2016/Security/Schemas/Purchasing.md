#### 

[Project](../../../../../index.md) > [localhost](../../../../index.md) > [User databases](../../../index.md) > [AdventureWorks2016](../../index.md) > [Security](../index.md) > [Schemas](Schemas.md) > Purchasing

# ![Schemas](../../../../../Images/Schema32.png) Purchasing

---

## <a name="#description"></a>MS_Description

Contains objects related to vendors and purchase orders.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../Users/dbo.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE SCHEMA [Purchasing]
AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contains objects related to vendors and purchase orders.', 'SCHEMA', N'Purchasing', NULL, NULL, NULL, NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Purchasing].[ProductVendor]](../../Tables/ProductVendor.md)
* [[Purchasing].[PurchaseOrderDetail]](../../Tables/PurchaseOrderDetail.md)
* [[Purchasing].[PurchaseOrderHeader]](../../Tables/PurchaseOrderHeader.md)
* [[Purchasing].[ShipMethod]](../../Tables/ShipMethod.md)
* [[Purchasing].[Vendor]](../../Tables/Vendor.md)
* [[Purchasing].[vVendorWithAddresses]](../../Views/vVendorWithAddresses.md)
* [[Purchasing].[vVendorWithContacts]](../../Views/vVendorWithContacts.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

