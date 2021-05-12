###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.ShoppingCartItem


# ![logo](../../../../../Images/table.svg) Sales.ShoppingCartItem

## <a name="#Description"></a>Description
> Contains online customer orders until the order is submitted or cancelled.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation||
|File Group||
|Filestream File Group||
|Is Partitioned|False|
|Partitioned Column||
|Partition Scheme||
|File Groups||
|Filestream Partition Scheme||
|Filestream File Groups||
|Heap|False|
|Full Text Catalog||
|Full Text||
|Compression|NONE|
|Row Count (~)|3|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ShoppingCartItem_ShoppingCartItemID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ShoppingCartItem_ShoppingCartItemID](../../../../../Images/Cluster.svg)](#Indexes)|ShoppingCartItemID|int|4|10|0|True|1 - 1|||False|False|Primary key for ShoppingCartItem records.|
|[![Indexes IX_ShoppingCartItem_ShoppingCartID_ProductID](../../../../../Images/index.svg)](#Indexes)|ShoppingCartID|nvarchar|50|0|0|True||||False|False|Shopping cart identification number.|
|[![Check Constraint CK_ShoppingCartItem_Quantity](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Quantity|int|4|10|0|True|||(1)|False|False|Product quantity ordered.|
|[![Foreign Keys FK_ShoppingCartItem_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_ShoppingCartItem_ShoppingCartID_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product ordered. Foreign key to Product.ProductID.|
||DateCreated|datetime|8|23|3|True|||(getdate())|False|False|Date the time the record was created.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_ShoppingCartItem_ShoppingCartID_ProductID|ShoppingCartID, ProductID|False||Nonclustered index.|
|[![Primary Key PK_ShoppingCartItem_ShoppingCartItemID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ShoppingCartItem_ShoppingCartItemID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ShoppingCartItem_ShoppingCartItemID|ShoppingCartItemID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ShoppingCartItem_Quantity|Quantity|([Quantity]>=(1))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ShoppingCartItem_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.ShoppingCartItem (
  ShoppingCartItemID int IDENTITY,
  ShoppingCartID nvarchar(50) NOT NULL,
  Quantity int NOT NULL CONSTRAINT DF_ShoppingCartItem_Quantity DEFAULT (1),
  ProductID int NOT NULL,
  DateCreated datetime NOT NULL CONSTRAINT DF_ShoppingCartItem_DateCreated DEFAULT (getdate()),
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ShoppingCartItem_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ShoppingCartItem_ShoppingCartItemID PRIMARY KEY CLUSTERED (ShoppingCartItemID),
  CONSTRAINT CK_ShoppingCartItem_Quantity CHECK ([Quantity]>=(1))
)
ON [PRIMARY]
GO

CREATE INDEX IX_ShoppingCartItem_ShoppingCartID_ProductID
  ON Sales.ShoppingCartItem (ShoppingCartID, ProductID)
  ON [PRIMARY]
GO

ALTER TABLE Sales.ShoppingCartItem
  ADD CONSTRAINT FK_ShoppingCartItem_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'FK_ShoppingCartItem_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains online customer orders until the order is submitted or cancelled.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ShoppingCartItem records.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shopping cart identification number.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ShoppingCartID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product quantity ordered.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product ordered. Foreign key to Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the time the record was created.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'DateCreated'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'INDEX', N'IX_ShoppingCartItem_ShoppingCartID_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'INDEX', N'PK_ShoppingCartItem_ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'PK_ShoppingCartItem_ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Quantity] >= (1)', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'CK_ShoppingCartItem_Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_DateCreated'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_Quantity'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Sales](../Security/Schemas/Sales.md)
- [Production.Product](Production.Product.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial