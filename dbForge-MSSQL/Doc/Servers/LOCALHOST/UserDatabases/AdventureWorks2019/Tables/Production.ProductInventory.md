###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductInventory


# ![logo](../../../../../Images/table.svg) Production.ProductInventory

## <a name="#Description"></a>Description
> Product inventory information.
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
|Row Count (~)|1069|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductInventory_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Primary Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductInventory_Location_LocationID: Production.Location](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/Cluster.svg)](#Indexes)|LocationID|smallint|2|5|0|True||||False|False|Inventory location identification number. Foreign key to Location.LocationID. |
|[![Check Constraint CK_ProductInventory_Shelf](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Shelf|nvarchar|10|0|0|True||||False|False|Storage compartment within an inventory location.|
|[![Check Constraint CK_ProductInventory_Bin](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Bin|tinyint|1|3|0|True||||False|False|Storage container on a shelf in an inventory location.|
||Quantity|smallint|2|5|0|True|||(0)|False|False|Quantity of products in the inventory location.|
||rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductInventory_ProductID_LocationID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductInventory_ProductID_LocationID|ProductID, LocationID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ProductInventory_Bin|Bin|([Bin]>=(0) AND [Bin]<=(100))||
|CK_ProductInventory_Shelf|Shelf|([Shelf] like '[A-Za-z]' OR [Shelf]='N/A')||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductInventory_Location_LocationID|LocationID|Foreign key constraint referencing Location.LocationID.|
|FK_ProductInventory_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductInventory (
  ProductID int NOT NULL,
  LocationID smallint NOT NULL,
  Shelf nvarchar(10) NOT NULL,
  Bin tinyint NOT NULL,
  Quantity smallint NOT NULL CONSTRAINT DF_ProductInventory_Quantity DEFAULT (0),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ProductInventory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductInventory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductInventory_ProductID_LocationID PRIMARY KEY CLUSTERED (ProductID, LocationID),
  CONSTRAINT CK_ProductInventory_Bin CHECK ([Bin]>=(0) AND [Bin]<=(100)),
  CONSTRAINT CK_ProductInventory_Shelf CHECK ([Shelf] like '[A-Za-z]' OR [Shelf]='N/A')
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductInventory
  ADD CONSTRAINT FK_ProductInventory_Location_LocationID FOREIGN KEY (LocationID) REFERENCES Production.Location (LocationID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Location.LocationID.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'FK_ProductInventory_Location_LocationID'
GO

ALTER TABLE Production.ProductInventory
  ADD CONSTRAINT FK_ProductInventory_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'FK_ProductInventory_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product inventory information.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Inventory location identification number. Foreign key to Location.LocationID. ', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Storage compartment within an inventory location.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'Shelf'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Storage container on a shelf in an inventory location.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'Bin'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity of products in the inventory location.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'INDEX', N'PK_ProductInventory_ProductID_LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'PK_ProductInventory_ProductID_LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Bin] BETWEEN (0) AND (100)', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'CK_ProductInventory_Bin'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Shelf] like ''[A-Za-z]'' OR [Shelf]=''N/A''', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'CK_ProductInventory_Shelf'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'DF_ProductInventory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'DF_ProductInventory_Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'ProductInventory', 'CONSTRAINT', N'DF_ProductInventory_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.Location](Production.Location.md)
- [Production.Product](Production.Product.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [dbo.ufnGetStock](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetStock.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial