###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SpecialOfferProduct


# ![logo](../../../../../Images/table.svg) Sales.SpecialOfferProduct

## <a name="#Description"></a>Description
> Cross-reference table mapping products to special offer discounts.
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
|Row Count (~)|538|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID: Sales.SpecialOffer](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/Cluster.svg)](#Indexes)|SpecialOfferID|int|4|10|0|True||||False|False|Primary key for SpecialOfferProduct records.|
|[![Primary Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SpecialOfferProduct_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_SpecialOfferProduct_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Indexes AK_SpecialOfferProduct_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SpecialOfferProduct_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_SpecialOfferProduct_ProductID|ProductID|False||Nonclustered index.|
|[![Primary Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SpecialOfferProduct_SpecialOfferID_ProductID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SpecialOfferProduct_SpecialOfferID_ProductID|SpecialOfferID, ProductID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SpecialOfferProduct_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|
|FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID|SpecialOfferID|Foreign key constraint referencing SpecialOffer.SpecialOfferID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SpecialOfferProduct (
  SpecialOfferID int NOT NULL,
  ProductID int NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SpecialOfferProduct_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SpecialOfferProduct_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SpecialOfferProduct_SpecialOfferID_ProductID PRIMARY KEY CLUSTERED (SpecialOfferID, ProductID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SpecialOfferProduct_rowguid
  ON Sales.SpecialOfferProduct (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_SpecialOfferProduct_ProductID
  ON Sales.SpecialOfferProduct (ProductID)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SpecialOfferProduct
  ADD CONSTRAINT FK_SpecialOfferProduct_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'FK_SpecialOfferProduct_Product_ProductID'
GO

ALTER TABLE Sales.SpecialOfferProduct
  ADD CONSTRAINT FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID FOREIGN KEY (SpecialOfferID) REFERENCES Sales.SpecialOffer (SpecialOfferID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SpecialOffer.SpecialOfferID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping products to special offer discounts.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SpecialOfferProduct records.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'AK_SpecialOfferProduct_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'IX_SpecialOfferProduct_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'DF_SpecialOfferProduct_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'DF_SpecialOfferProduct_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Production.Product](Production.Product.md)
- [Sales.SpecialOffer](Sales.SpecialOffer.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.SalesOrderDetail](Sales.SalesOrderDetail.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial