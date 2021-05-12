###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductDocument


# ![logo](../../../../../Images/table.svg) Production.ProductDocument

## <a name="#Description"></a>Description
> Cross-reference table mapping products to related product documents.
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
|Row Count (~)|32|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductDocument_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Primary Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductDocument_Document_DocumentNode: Production.Document](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/Cluster.svg)](#Indexes)|DocumentNode|hierarchyid|892|0|0|True||||False|False|Document identification number. Foreign key to Document.DocumentNode.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductDocument_ProductID_DocumentNode](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductDocument_ProductID_DocumentNode|ProductID, DocumentNode|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductDocument_Document_DocumentNode|DocumentNode|Foreign key constraint referencing Document.DocumentNode.|
|FK_ProductDocument_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductDocument (
  ProductID int NOT NULL,
  DocumentNode hierarchyid NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductDocument_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductDocument_ProductID_DocumentNode PRIMARY KEY CLUSTERED (ProductID, DocumentNode)
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductDocument
  ADD CONSTRAINT FK_ProductDocument_Document_DocumentNode FOREIGN KEY (DocumentNode) REFERENCES Production.Document (DocumentNode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Document.DocumentNode.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'FK_ProductDocument_Document_DocumentNode'
GO

ALTER TABLE Production.ProductDocument
  ADD CONSTRAINT FK_ProductDocument_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'FK_ProductDocument_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping products to related product documents.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Document identification number. Foreign key to Document.DocumentNode.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'INDEX', N'PK_ProductDocument_ProductID_DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'PK_ProductDocument_ProductID_DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'DF_ProductDocument_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.Document](Production.Document.md)
- [Production.Product](Production.Product.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial