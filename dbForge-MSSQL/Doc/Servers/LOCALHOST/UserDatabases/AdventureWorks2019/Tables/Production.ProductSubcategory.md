###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductSubcategory


# ![logo](../../../../../Images/table.svg) Production.ProductSubcategory

## <a name="#Description"></a>Description
> Product subcategories. See ProductCategory table.
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
|Row Count (~)|37|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductSubcategory_ProductSubcategoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductSubcategory_ProductSubcategoryID](../../../../../Images/Cluster.svg)](#Indexes)|ProductSubcategoryID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductSubcategory records.|
|[![Foreign Keys FK_ProductSubcategory_ProductCategory_ProductCategoryID: Production.ProductCategory](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ProductCategoryID|int|4|10|0|True||||False|False|Product category identification number. Foreign key to ProductCategory.ProductCategoryID.|
|[![Indexes AK_ProductSubcategory_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Subcategory description.|
|[![Indexes AK_ProductSubcategory_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ProductSubcategory_Name|Name|True||Unique nonclustered index.|
||AK_ProductSubcategory_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_ProductSubcategory_ProductSubcategoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductSubcategory_ProductSubcategoryID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductSubcategory_ProductSubcategoryID|ProductSubcategoryID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductSubcategory_ProductCategory_ProductCategoryID|ProductCategoryID|Foreign key constraint referencing ProductCategory.ProductCategoryID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductSubcategory (
  ProductSubcategoryID int IDENTITY,
  ProductCategoryID int NOT NULL,
  Name dbo.Name NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ProductSubcategory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductSubcategory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductSubcategory_ProductSubcategoryID PRIMARY KEY CLUSTERED (ProductSubcategoryID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductSubcategory_Name
  ON Production.ProductSubcategory (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductSubcategory_rowguid
  ON Production.ProductSubcategory (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Production.ProductSubcategory
  ADD CONSTRAINT FK_ProductSubcategory_ProductCategory_ProductCategoryID FOREIGN KEY (ProductCategoryID) REFERENCES Production.ProductCategory (ProductCategoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductCategory.ProductCategoryID.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'CONSTRAINT', N'FK_ProductSubcategory_ProductCategory_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product subcategories. See ProductCategory table.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductSubcategory records.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'COLUMN', N'ProductSubcategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product category identification number. Foreign key to ProductCategory.ProductCategoryID.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'COLUMN', N'ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Subcategory description.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'INDEX', N'AK_ProductSubcategory_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'INDEX', N'AK_ProductSubcategory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'INDEX', N'PK_ProductSubcategory_ProductSubcategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'CONSTRAINT', N'PK_ProductSubcategory_ProductSubcategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'CONSTRAINT', N'DF_ProductSubcategory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'ProductSubcategory', 'CONSTRAINT', N'DF_ProductSubcategory_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.ProductCategory](Production.ProductCategory.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.Product](Production.Product.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial