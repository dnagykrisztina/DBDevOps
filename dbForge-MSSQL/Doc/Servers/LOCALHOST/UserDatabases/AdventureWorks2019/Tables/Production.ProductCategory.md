###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductCategory


# ![logo](../../../../../Images/table.svg) Production.ProductCategory

## <a name="#Description"></a>Description
> High-level product categorization.
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
|Row Count (~)|4|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductCategory_ProductCategoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductCategory_ProductCategoryID](../../../../../Images/Cluster.svg)](#Indexes)|ProductCategoryID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductCategory records.|
|[![Indexes AK_ProductCategory_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Category description.|
|[![Indexes AK_ProductCategory_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ProductCategory_Name|Name|True||Unique nonclustered index.|
||AK_ProductCategory_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_ProductCategory_ProductCategoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductCategory_ProductCategoryID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductCategory_ProductCategoryID|ProductCategoryID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductCategory (
  ProductCategoryID int IDENTITY,
  Name dbo.Name NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ProductCategory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductCategory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductCategory_ProductCategoryID PRIMARY KEY CLUSTERED (ProductCategoryID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductCategory_Name
  ON Production.ProductCategory (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductCategory_rowguid
  ON Production.ProductCategory (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'High-level product categorization.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductCategory records.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'COLUMN', N'ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Category description.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'INDEX', N'AK_ProductCategory_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'INDEX', N'AK_ProductCategory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'INDEX', N'PK_ProductCategory_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'PK_ProductCategory_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'DF_ProductCategory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()()', 'SCHEMA', N'Production', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'DF_ProductCategory_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductSubcategory](Production.ProductSubcategory.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial