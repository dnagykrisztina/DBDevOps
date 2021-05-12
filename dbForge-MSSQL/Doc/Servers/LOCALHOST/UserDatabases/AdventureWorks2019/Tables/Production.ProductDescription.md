###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductDescription


# ![logo](../../../../../Images/table.svg) Production.ProductDescription

## <a name="#Description"></a>Description
> Product descriptions in several languages.
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
|Row Count (~)|762|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductDescription_ProductDescriptionID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductDescription_ProductDescriptionID](../../../../../Images/Cluster.svg)](#Indexes)|ProductDescriptionID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductDescription records.|
||Description|nvarchar|400|0|0|True||||False|False|Description of the product.|
|[![Indexes AK_ProductDescription_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ProductDescription_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_ProductDescription_ProductDescriptionID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductDescription_ProductDescriptionID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductDescription_ProductDescriptionID|ProductDescriptionID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductDescription (
  ProductDescriptionID int IDENTITY,
  Description nvarchar(400) NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ProductDescription_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductDescription_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductDescription_ProductDescriptionID PRIMARY KEY CLUSTERED (ProductDescriptionID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductDescription_rowguid
  ON Production.ProductDescription (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product descriptions in several languages.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductDescription records.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'ProductDescriptionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Description of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'Description'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'INDEX', N'AK_ProductDescription_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'INDEX', N'PK_ProductDescription_ProductDescriptionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'PK_ProductDescription_ProductDescriptionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'DF_ProductDescription_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'DF_ProductDescription_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Production](../Security/Schemas/Production.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [Production.ProductModelProductDescriptionCulture](Production.ProductModelProductDescriptionCulture.md)
- [Production.vProductAndDescription](../Views/Production.vProductAndDescription.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial