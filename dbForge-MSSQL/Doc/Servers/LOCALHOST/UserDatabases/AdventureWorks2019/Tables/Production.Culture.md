###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.Culture


# ![logo](../../../../../Images/table.svg) Production.Culture

## <a name="#Description"></a>Description
> Lookup table containing the languages in which some AdventureWorks data is stored.
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
|Row Count (~)|8|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Culture_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Culture_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|CultureID|nchar|6|0|0|True||||False|False|Primary key for Culture records.|
|[![Indexes AK_Culture_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Culture description.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Culture_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_Culture_CultureID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Culture_CultureID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Culture_CultureID|CultureID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.Culture (
  CultureID nchar(6) NOT NULL,
  Name dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Culture_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Culture_CultureID PRIMARY KEY CLUSTERED (CultureID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Culture_Name
  ON Production.Culture (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table containing the languages in which some AdventureWorks data is stored.', 'SCHEMA', N'Production', 'TABLE', N'Culture'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Culture records.', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'COLUMN', N'CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Culture description.', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'INDEX', N'AK_Culture_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'INDEX', N'PK_Culture_CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'CONSTRAINT', N'PK_Culture_CultureID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Culture', 'CONSTRAINT', N'DF_Culture_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductModelProductDescriptionCulture](Production.ProductModelProductDescriptionCulture.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial