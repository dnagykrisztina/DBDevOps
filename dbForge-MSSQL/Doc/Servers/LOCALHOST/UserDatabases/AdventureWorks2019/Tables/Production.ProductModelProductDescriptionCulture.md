###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductModelProductDescriptionCulture


# ![logo](../../../../../Images/table.svg) Production.ProductModelProductDescriptionCulture

## <a name="#Description"></a>Description
> Cross-reference table mapping product descriptions and the language the description is written in.
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
|[![Primary Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID: Production.ProductModel](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|ProductModelID|int|4|10|0|True||||False|False|Primary key. Foreign key to ProductModel.ProductModelID.|
|[![Primary Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID: Production.ProductDescription](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|ProductDescriptionID|int|4|10|0|True||||False|False|Primary key. Foreign key to ProductDescription.ProductDescriptionID.|
|[![Primary Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductModelProductDescriptionCulture_Culture_CultureID: Production.Culture](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|CultureID|nchar|6|0|0|True||||False|False|Culture identification number. Foreign key to Culture.CultureID.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID|ProductModelID, ProductDescriptionID, CultureID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductModelProductDescriptionCulture_Culture_CultureID|CultureID|Foreign key constraint referencing Culture.CultureID.|
|FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID|ProductDescriptionID|Foreign key constraint referencing ProductDescription.ProductDescriptionID.|
|FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID|ProductModelID|Foreign key constraint referencing ProductModel.ProductModelID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductModelProductDescriptionCulture (
  ProductModelID int NOT NULL,
  ProductDescriptionID int NOT NULL,
  CultureID nchar(6) NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductModelProductDescriptionCulture_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID PRIMARY KEY CLUSTERED (ProductModelID, ProductDescriptionID, CultureID)
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductModelProductDescriptionCulture
  ADD CONSTRAINT FK_ProductModelProductDescriptionCulture_Culture_CultureID FOREIGN KEY (CultureID) REFERENCES Production.Culture (CultureID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Culture.CultureID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'CONSTRAINT', N'FK_ProductModelProductDescriptionCulture_Culture_CultureID'
GO

ALTER TABLE Production.ProductModelProductDescriptionCulture
  ADD CONSTRAINT FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID FOREIGN KEY (ProductDescriptionID) REFERENCES Production.ProductDescription (ProductDescriptionID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductDescription.ProductDescriptionID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'CONSTRAINT', N'FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID'
GO

ALTER TABLE Production.ProductModelProductDescriptionCulture
  ADD CONSTRAINT FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID FOREIGN KEY (ProductModelID) REFERENCES Production.ProductModel (ProductModelID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'CONSTRAINT', N'FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping product descriptions and the language the description is written in.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to ProductDescription.ProductDescriptionID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'COLUMN', N'ProductDescriptionID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Culture identification number. Foreign key to Culture.CultureID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'COLUMN', N'CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'INDEX', N'PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'CONSTRAINT', N'PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductModelProductDescriptionCulture', 'CONSTRAINT', N'DF_ProductModelProductDescriptionCulture_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Production](../Security/Schemas/Production.md)
- [Production.Culture](Production.Culture.md)
- [Production.ProductDescription](Production.ProductDescription.md)
- [Production.ProductModel](Production.ProductModel.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.vProductAndDescription](../Views/Production.vProductAndDescription.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial