#### 

[Project](../../../../../../index.md) > [localhost](../../../../../index.md) > [User databases](../../../../index.md) > [AdventureWorks2016](../../../index.md) > [Programmability](../../index.md) > [Types](../index.md) > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.OrderNumber

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[OrderNumber]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | nvarchar |
| Length | 25 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[OrderNumber] FROM nvarchar (25) NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Sales].[SalesOrderHeader]](../../../Tables/SalesOrderHeader.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

