###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ScrapReason


# ![logo](../../../../../Images/table.svg) Production.ScrapReason

## <a name="#Description"></a>Description
> Manufacturing failure reasons lookup table.
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
|Row Count (~)|16|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ScrapReason_ScrapReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ScrapReason_ScrapReasonID](../../../../../Images/Cluster.svg)](#Indexes)|ScrapReasonID|smallint|2|5|0|True|1 - 1|||False|False|Primary key for ScrapReason records.|
|[![Indexes AK_ScrapReason_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Failure description.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ScrapReason_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_ScrapReason_ScrapReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ScrapReason_ScrapReasonID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ScrapReason_ScrapReasonID|ScrapReasonID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ScrapReason (
  ScrapReasonID smallint IDENTITY,
  Name dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ScrapReason_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ScrapReason_ScrapReasonID PRIMARY KEY CLUSTERED (ScrapReasonID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ScrapReason_Name
  ON Production.ScrapReason (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing failure reasons lookup table.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ScrapReason records.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'COLUMN', N'ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Failure description.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'INDEX', N'AK_ScrapReason_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'INDEX', N'PK_ScrapReason_ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'CONSTRAINT', N'PK_ScrapReason_ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ScrapReason', 'CONSTRAINT', N'DF_ScrapReason_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.WorkOrder](Production.WorkOrder.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial