###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Purchasing.ProductVendor


# ![logo](../../../../../Images/table.svg) Purchasing.ProductVendor

## <a name="#Description"></a>Description
> Cross-reference table mapping vendors with the products they supply.
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
|Row Count (~)|460|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductVendor_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Primary key. Foreign key to Product.ProductID.|
|[![Primary Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductVendor_Vendor_BusinessEntityID: Purchasing.Vendor](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_ProductVendor_BusinessEntityID](../../../../../Images/index.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. Foreign key to Vendor.BusinessEntityID.|
|[![Check Constraint CK_ProductVendor_AverageLeadTime](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|AverageLeadTime|int|4|10|0|True||||False|False|The average span of time (in days) between placing an order with the vendor and receiving the purchased product.|
|[![Check Constraint CK_ProductVendor_StandardPrice](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|StandardPrice|money|8|19|4|True||||False|False|The vendor's usual selling price.|
|[![Check Constraint CK_ProductVendor_LastReceiptCost](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|LastReceiptCost|money|8|19|4|False||||False|False|The selling price when last purchased.|
||LastReceiptDate|datetime|8|23|3|False||||False|False|Date the product was last received by the vendor.|
|[![Check Constraint CK_ProductVendor_MinOrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|MinOrderQty|int|4|10|0|True||||False|False|The maximum quantity that should be ordered.|
|[![Check Constraint CK_ProductVendor_MaxOrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|MaxOrderQty|int|4|10|0|True||||False|False|The minimum quantity that should be ordered.|
|[![Check Constraint CK_ProductVendor_OnOrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|OnOrderQty|int|4|10|0|False||||False|False|The quantity currently on order.|
|[![Foreign Keys FK_ProductVendor_UnitMeasure_UnitMeasureCode: Production.UnitMeasure](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_ProductVendor_UnitMeasureCode](../../../../../Images/index.svg)](#Indexes)|UnitMeasureCode|nchar|3|0|0|True||||False|False|The product's unit of measure.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_ProductVendor_BusinessEntityID|BusinessEntityID|False||Nonclustered index.|
||IX_ProductVendor_UnitMeasureCode|UnitMeasureCode|False||Nonclustered index.|
|[![Primary Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductVendor_ProductID_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductVendor_ProductID_BusinessEntityID|ProductID, BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ProductVendor_AverageLeadTime|AverageLeadTime|([AverageLeadTime]>=(1))||
|CK_ProductVendor_LastReceiptCost|LastReceiptCost|([LastReceiptCost]>(0.00))||
|CK_ProductVendor_MaxOrderQty|MaxOrderQty|([MaxOrderQty]>=(1))||
|CK_ProductVendor_MinOrderQty|MinOrderQty|([MinOrderQty]>=(1))||
|CK_ProductVendor_OnOrderQty|OnOrderQty|([OnOrderQty]>=(0))||
|CK_ProductVendor_StandardPrice|StandardPrice|([StandardPrice]>(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductVendor_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|
|FK_ProductVendor_UnitMeasure_UnitMeasureCode|UnitMeasureCode|Foreign key constraint referencing UnitMeasure.UnitMeasureCode.|
|FK_ProductVendor_Vendor_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Vendor.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Purchasing.ProductVendor (
  ProductID int NOT NULL,
  BusinessEntityID int NOT NULL,
  AverageLeadTime int NOT NULL,
  StandardPrice money NOT NULL,
  LastReceiptCost money NULL,
  LastReceiptDate datetime NULL,
  MinOrderQty int NOT NULL,
  MaxOrderQty int NOT NULL,
  OnOrderQty int NULL,
  UnitMeasureCode nchar(3) NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductVendor_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductVendor_ProductID_BusinessEntityID PRIMARY KEY CLUSTERED (ProductID, BusinessEntityID),
  CONSTRAINT CK_ProductVendor_AverageLeadTime CHECK ([AverageLeadTime]>=(1)),
  CONSTRAINT CK_ProductVendor_LastReceiptCost CHECK ([LastReceiptCost]>(0.00)),
  CONSTRAINT CK_ProductVendor_MaxOrderQty CHECK ([MaxOrderQty]>=(1)),
  CONSTRAINT CK_ProductVendor_MinOrderQty CHECK ([MinOrderQty]>=(1)),
  CONSTRAINT CK_ProductVendor_OnOrderQty CHECK ([OnOrderQty]>=(0)),
  CONSTRAINT CK_ProductVendor_StandardPrice CHECK ([StandardPrice]>(0.00))
)
ON [PRIMARY]
GO

CREATE INDEX IX_ProductVendor_BusinessEntityID
  ON Purchasing.ProductVendor (BusinessEntityID)
  ON [PRIMARY]
GO

CREATE INDEX IX_ProductVendor_UnitMeasureCode
  ON Purchasing.ProductVendor (UnitMeasureCode)
  ON [PRIMARY]
GO

ALTER TABLE Purchasing.ProductVendor
  ADD CONSTRAINT FK_ProductVendor_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'FK_ProductVendor_Product_ProductID'
GO

ALTER TABLE Purchasing.ProductVendor
  ADD CONSTRAINT FK_ProductVendor_UnitMeasure_UnitMeasureCode FOREIGN KEY (UnitMeasureCode) REFERENCES Production.UnitMeasure (UnitMeasureCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'FK_ProductVendor_UnitMeasure_UnitMeasureCode'
GO

ALTER TABLE Purchasing.ProductVendor
  ADD CONSTRAINT FK_ProductVendor_Vendor_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Purchasing.Vendor (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Vendor.BusinessEntityID.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'FK_ProductVendor_Vendor_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping vendors with the products they supply.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Product.ProductID.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Vendor.BusinessEntityID.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The average span of time (in days) between placing an order with the vendor and receiving the purchased product.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'AverageLeadTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The vendor''s usual selling price.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'StandardPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The selling price when last purchased.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'LastReceiptCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was last received by the vendor.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'LastReceiptDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The maximum quantity that should be ordered.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'MinOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The minimum quantity that should be ordered.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'MaxOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The quantity currently on order.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'OnOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The product''s unit of measure.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'INDEX', N'IX_ProductVendor_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'INDEX', N'IX_ProductVendor_UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'INDEX', N'PK_ProductVendor_ProductID_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'PK_ProductVendor_ProductID_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [AverageLeadTime] >= (1)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_AverageLeadTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [LastReceiptCost] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_LastReceiptCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MaxOrderQty] >= (1)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_MaxOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MinOrderQty] >= (1)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_MinOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [OnOrderQty] >= (0)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_OnOrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [StandardPrice] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'CK_ProductVendor_StandardPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'ProductVendor', 'CONSTRAINT', N'DF_ProductVendor_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Purchasing](../Security/Schemas/Purchasing.md)
- [Production.Product](Production.Product.md)
- [Production.UnitMeasure](Production.UnitMeasure.md)
- [Purchasing.Vendor](Purchasing.Vendor.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial