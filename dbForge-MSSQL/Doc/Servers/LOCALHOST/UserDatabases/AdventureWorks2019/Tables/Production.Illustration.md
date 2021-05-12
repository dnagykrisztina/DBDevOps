###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.Illustration


# ![logo](../../../../../Images/table.svg) Production.Illustration

## <a name="#Description"></a>Description
> Bicycle assembly diagrams.
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
|Row Count (~)|5|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Illustration_IllustrationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Illustration_IllustrationID](../../../../../Images/Cluster.svg)](#Indexes)|IllustrationID|int|4|10|0|True|1 - 1|||False|False|Primary key for Illustration records.|
||Diagram|xml||0|0|False||||False|False|Illustrations used in manufacturing instructions. Stored as XML.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_Illustration_IllustrationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Illustration_IllustrationID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Illustration_IllustrationID|IllustrationID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.Illustration (
  IllustrationID int IDENTITY,
  Diagram xml NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Illustration_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Illustration_IllustrationID PRIMARY KEY CLUSTERED (IllustrationID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Bicycle assembly diagrams.', 'SCHEMA', N'Production', 'TABLE', N'Illustration'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Illustration records.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Illustrations used in manufacturing instructions. Stored as XML.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'Diagram'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'INDEX', N'PK_Illustration_IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'CONSTRAINT', N'PK_Illustration_IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'CONSTRAINT', N'DF_Illustration_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Production](../Security/Schemas/Production.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductModelIllustration](Production.ProductModelIllustration.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial