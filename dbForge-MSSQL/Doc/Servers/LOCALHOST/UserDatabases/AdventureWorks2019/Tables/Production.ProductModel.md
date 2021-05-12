###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductModel


# ![logo](../../../../../Images/table.svg) Production.ProductModel

## <a name="#Description"></a>Description
> Product model classification.
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
|Row Count (~)|128|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductModel_ProductModelID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductModel_ProductModelID](../../../../../Images/Cluster.svg)](#Indexes)|ProductModelID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductModel records.|
|[![Indexes AK_ProductModel_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Product model description.|
|[![Indexes PXML_ProductModel_CatalogDescription](../../../../../Images/index.svg)](#Indexes)|CatalogDescription|[Production.ProductDescriptionSchemaCollection](../Programmability/Types/XmlSchemaCollection/Production.ProductDescriptionSchemaCollection.md)||0|0|False||||False|False|Detailed product catalog information in xml format.|
|[![Indexes PXML_ProductModel_Instructions](../../../../../Images/index.svg)](#Indexes)|Instructions|[Production.ManuInstructionsSchemaCollection](../Programmability/Types/XmlSchemaCollection/Production.ManuInstructionsSchemaCollection.md)||0|0|False||||False|False|Manufacturing instructions in xml format.|
|[![Indexes AK_ProductModel_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ProductModel_Name|Name|True||Unique nonclustered index.|
||AK_ProductModel_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_ProductModel_ProductModelID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductModel_ProductModelID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductModel_ProductModelID|ProductModelID|True||Clustered index created by a primary key constraint.|
||PXML_ProductModel_CatalogDescription|CatalogDescription|False||Primary XML index.|
||PXML_ProductModel_Instructions|Instructions|False||Primary XML index.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductModel (
  ProductModelID int IDENTITY,
  Name dbo.Name NOT NULL,
  CatalogDescription xml (CONTENT Production.ProductDescriptionSchemaCollection) NULL,
  Instructions xml (CONTENT Production.ManuInstructionsSchemaCollection) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ProductModel_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductModel_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductModel_ProductModelID PRIMARY KEY CLUSTERED (ProductModelID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX PXML_ProductModel_Instructions
  ON Production.ProductModel (Instructions)
GO

CREATE PRIMARY XML INDEX PXML_ProductModel_CatalogDescription
  ON Production.ProductModel (CatalogDescription)
GO

CREATE UNIQUE INDEX AK_ProductModel_Name
  ON Production.ProductModel (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ProductModel_rowguid
  ON Production.ProductModel (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'INDEX', N'PXML_ProductModel_Instructions'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'INDEX', N'PXML_ProductModel_CatalogDescription'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product model classification.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductModel records.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product model description.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Detailed product catalog information in xml format.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'CatalogDescription'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing instructions in xml format.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'Instructions'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'INDEX', N'AK_ProductModel_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'INDEX', N'AK_ProductModel_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'INDEX', N'PK_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'CONSTRAINT', N'PK_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'CONSTRAINT', N'DF_ProductModel_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'CONSTRAINT', N'DF_ProductModel_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Production.ProductDescriptionSchemaCollection](../Programmability/Types/XmlSchemaCollection/Production.ProductDescriptionSchemaCollection.md)
- [Production.ManuInstructionsSchemaCollection](../Programmability/Types/XmlSchemaCollection/Production.ManuInstructionsSchemaCollection.md)


## <a name="#UsedBy"></a>Used By _`6`_
- [Production.Product](Production.Product.md)
- [Production.ProductModelIllustration](Production.ProductModelIllustration.md)
- [Production.ProductModelProductDescriptionCulture](Production.ProductModelProductDescriptionCulture.md)
- [Production.vProductAndDescription](../Views/Production.vProductAndDescription.md)
- [Production.vProductModelCatalogDescription](../Views/Production.vProductModelCatalogDescription.md)
- [Production.vProductModelInstructions](../Views/Production.vProductModelInstructions.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial