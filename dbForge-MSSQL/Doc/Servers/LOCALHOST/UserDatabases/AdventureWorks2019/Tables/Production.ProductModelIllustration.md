###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductModelIllustration


# ![logo](../../../../../Images/table.svg) Production.ProductModelIllustration

## <a name="#Description"></a>Description
> Cross-reference table mapping product models and illustrations.
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
|Row Count (~)|7|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductModelIllustration_ProductModel_ProductModelID: Production.ProductModel](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/Cluster.svg)](#Indexes)|ProductModelID|int|4|10|0|True||||False|False|Primary key. Foreign key to ProductModel.ProductModelID.|
|[![Primary Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductModelIllustration_Illustration_IllustrationID: Production.Illustration](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/Cluster.svg)](#Indexes)|IllustrationID|int|4|10|0|True||||False|False|Primary key. Foreign key to Illustration.IllustrationID.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductModelIllustration_ProductModelID_IllustrationID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductModelIllustration_ProductModelID_IllustrationID|ProductModelID, IllustrationID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductModelIllustration_Illustration_IllustrationID|IllustrationID|Foreign key constraint referencing Illustration.IllustrationID.|
|FK_ProductModelIllustration_ProductModel_ProductModelID|ProductModelID|Foreign key constraint referencing ProductModel.ProductModelID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductModelIllustration (
  ProductModelID int NOT NULL,
  IllustrationID int NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductModelIllustration_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductModelIllustration_ProductModelID_IllustrationID PRIMARY KEY CLUSTERED (ProductModelID, IllustrationID)
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductModelIllustration
  ADD CONSTRAINT FK_ProductModelIllustration_Illustration_IllustrationID FOREIGN KEY (IllustrationID) REFERENCES Production.Illustration (IllustrationID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Illustration.IllustrationID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'CONSTRAINT', N'FK_ProductModelIllustration_Illustration_IllustrationID'
GO

ALTER TABLE Production.ProductModelIllustration
  ADD CONSTRAINT FK_ProductModelIllustration_ProductModel_ProductModelID FOREIGN KEY (ProductModelID) REFERENCES Production.ProductModel (ProductModelID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'CONSTRAINT', N'FK_ProductModelIllustration_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping product models and illustrations.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Illustration.IllustrationID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'INDEX', N'PK_ProductModelIllustration_ProductModelID_IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'CONSTRAINT', N'PK_ProductModelIllustration_ProductModelID_IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'CONSTRAINT', N'DF_ProductModelIllustration_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.Illustration](Production.Illustration.md)
- [Production.ProductModel](Production.ProductModel.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial