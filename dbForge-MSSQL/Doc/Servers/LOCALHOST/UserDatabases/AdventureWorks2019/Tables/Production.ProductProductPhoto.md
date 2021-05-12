###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductProductPhoto


# ![logo](../../../../../Images/table.svg) Production.ProductProductPhoto

## <a name="#Description"></a>Description
> Cross-reference table mapping products and product photos.
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
|Heap|True|
|Full Text Catalog||
|Full Text||
|Compression|NONE|
|Row Count (~)|504|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductProductPhoto_ProductID_ProductPhotoID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductProductPhoto_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Primary Key PK_ProductProductPhoto_ProductID_ProductPhotoID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductProductPhoto_ProductPhoto_ProductPhotoID: Production.ProductPhoto](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ProductPhotoID|int|4|10|0|True||||False|False|Product photo identification number. Foreign key to ProductPhoto.ProductPhotoID.|
||Primary|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(0)|False|False|0 = Photo is not the principal image. 1 = Photo is the principal image.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductProductPhoto_ProductID_ProductPhotoID](../../../../../Images/primarykey.svg)](#Indexes)|PK_ProductProductPhoto_ProductID_ProductPhotoID|ProductID, ProductPhotoID|True||Nonclustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductProductPhoto_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|
|FK_ProductProductPhoto_ProductPhoto_ProductPhotoID|ProductPhotoID|Foreign key constraint referencing ProductPhoto.ProductPhotoID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductProductPhoto (
  ProductID int NOT NULL,
  ProductPhotoID int NOT NULL,
  [Primary] dbo.Flag NOT NULL CONSTRAINT DF_ProductProductPhoto_Primary DEFAULT (0),
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductProductPhoto_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductProductPhoto_ProductID_ProductPhotoID PRIMARY KEY NONCLUSTERED (ProductID, ProductPhotoID)
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductProductPhoto
  ADD CONSTRAINT FK_ProductProductPhoto_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'CONSTRAINT', N'FK_ProductProductPhoto_Product_ProductID'
GO

ALTER TABLE Production.ProductProductPhoto
  ADD CONSTRAINT FK_ProductProductPhoto_ProductPhoto_ProductPhotoID FOREIGN KEY (ProductPhotoID) REFERENCES Production.ProductPhoto (ProductPhotoID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductPhoto.ProductPhotoID.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'CONSTRAINT', N'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping products and product photos.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product photo identification number. Foreign key to ProductPhoto.ProductPhotoID.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'COLUMN', N'ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Photo is not the principal image. 1 = Photo is the principal image.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'COLUMN', N'Primary'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'INDEX', N'PK_ProductProductPhoto_ProductID_ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'CONSTRAINT', N'PK_ProductProductPhoto_ProductID_ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'CONSTRAINT', N'DF_ProductProductPhoto_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0 (FALSE)', 'SCHEMA', N'Production', 'TABLE', N'ProductProductPhoto', 'CONSTRAINT', N'DF_ProductProductPhoto_Primary'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)
- [Production.ProductPhoto](Production.ProductPhoto.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial