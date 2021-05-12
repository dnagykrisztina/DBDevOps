###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductPhoto


# ![logo](../../../../../Images/table.svg) Production.ProductPhoto

## <a name="#Description"></a>Description
> Product images.
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
|Row Count (~)|101|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductPhoto_ProductPhotoID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductPhoto_ProductPhotoID](../../../../../Images/Cluster.svg)](#Indexes)|ProductPhotoID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductPhoto records.|
||ThumbNailPhoto|varbinary||0|0|False||||False|False|Small image of the product.|
||ThumbnailPhotoFileName|nvarchar|50|0|0|False||||False|False|Small image file name.|
||LargePhoto|varbinary||0|0|False||||False|False|Large image of the product.|
||LargePhotoFileName|nvarchar|50|0|0|False||||False|False|Large image file name.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductPhoto_ProductPhotoID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductPhoto_ProductPhotoID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductPhoto_ProductPhotoID|ProductPhotoID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductPhoto (
  ProductPhotoID int IDENTITY,
  ThumbNailPhoto varbinary(max) NULL,
  ThumbnailPhotoFileName nvarchar(50) NULL,
  LargePhoto varbinary(max) NULL,
  LargePhotoFileName nvarchar(50) NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductPhoto_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductPhoto_ProductPhotoID PRIMARY KEY CLUSTERED (ProductPhotoID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product images.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductPhoto records.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Small image of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ThumbNailPhoto'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Small image file name.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ThumbnailPhotoFileName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Large image of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'LargePhoto'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Large image file name.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'LargePhotoFileName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'INDEX', N'PK_ProductPhoto_ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'CONSTRAINT', N'PK_ProductPhoto_ProductPhotoID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'CONSTRAINT', N'DF_ProductPhoto_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Production](../Security/Schemas/Production.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductProductPhoto](Production.ProductProductPhoto.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial