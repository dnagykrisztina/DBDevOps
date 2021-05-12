###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.TransactionHistoryArchive


# ![logo](../../../../../Images/table.svg) Production.TransactionHistoryArchive

## <a name="#Description"></a>Description
> Transactions for previous years.
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
|Row Count (~)|89253|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:09|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_TransactionHistoryArchive_TransactionID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_TransactionHistoryArchive_TransactionID](../../../../../Images/Cluster.svg)](#Indexes)|TransactionID|int|4|10|0|True||||False|False|Primary key for TransactionHistoryArchive records.|
|[![Indexes IX_TransactionHistoryArchive_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Indexes IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID](../../../../../Images/index.svg)](#Indexes)|ReferenceOrderID|int|4|10|0|True||||False|False|Purchase order, sales order, or work order identification number.|
|[![Indexes IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID](../../../../../Images/index.svg)](#Indexes)|ReferenceOrderLineID|int|4|10|0|True|||(0)|False|False|Line number associated with the purchase order, sales order, or work order.|
||TransactionDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time of the transaction.|
|[![Check Constraint CK_TransactionHistoryArchive_TransactionType](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|TransactionType|nchar|1|0|0|True||||False|False|W = Work Order, S = Sales Order, P = Purchase Order|
||Quantity|int|4|10|0|True||||False|False|Product quantity.|
||ActualCost|money|8|19|4|True||||False|False|Product cost.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_TransactionHistoryArchive_ProductID|ProductID|False||Nonclustered index.|
||IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID|ReferenceOrderID, ReferenceOrderLineID|False||Nonclustered index.|
|[![Primary Key PK_TransactionHistoryArchive_TransactionID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_TransactionHistoryArchive_TransactionID](../../../../../Images/Cluster.svg)](#Indexes)|PK_TransactionHistoryArchive_TransactionID|TransactionID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_TransactionHistoryArchive_TransactionType|TransactionType|(upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W')||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.TransactionHistoryArchive (
  TransactionID int NOT NULL,
  ProductID int NOT NULL,
  ReferenceOrderID int NOT NULL,
  ReferenceOrderLineID int NOT NULL CONSTRAINT DF_TransactionHistoryArchive_ReferenceOrderLineID DEFAULT (0),
  TransactionDate datetime NOT NULL CONSTRAINT DF_TransactionHistoryArchive_TransactionDate DEFAULT (getdate()),
  TransactionType nchar(1) NOT NULL,
  Quantity int NOT NULL,
  ActualCost money NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_TransactionHistoryArchive_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY KEY CLUSTERED (TransactionID),
  CONSTRAINT CK_TransactionHistoryArchive_TransactionType CHECK (upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W')
)
ON [PRIMARY]
GO

CREATE INDEX IX_TransactionHistoryArchive_ProductID
  ON Production.TransactionHistoryArchive (ProductID)
  ON [PRIMARY]
GO

CREATE INDEX IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID
  ON Production.TransactionHistoryArchive (ReferenceOrderID, ReferenceOrderLineID)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Transactions for previous years.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for TransactionHistoryArchive records.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'TransactionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Purchase order, sales order, or work order identification number.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'ReferenceOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Line number associated with the purchase order, sales order, or work order.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'ReferenceOrderLineID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time of the transaction.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'TransactionDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'W = Work Order, S = Sales Order, P = Purchase Order', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'TransactionType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product quantity.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product cost.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'ActualCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'INDEX', N'IX_TransactionHistoryArchive_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'INDEX', N'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'INDEX', N'PK_TransactionHistoryArchive_TransactionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'CONSTRAINT', N'PK_TransactionHistoryArchive_TransactionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W''', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'CONSTRAINT', N'CK_TransactionHistoryArchive_TransactionType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'CONSTRAINT', N'DF_TransactionHistoryArchive_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'CONSTRAINT', N'DF_TransactionHistoryArchive_ReferenceOrderLineID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistoryArchive', 'CONSTRAINT', N'DF_TransactionHistoryArchive_TransactionDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Production](../Security/Schemas/Production.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial