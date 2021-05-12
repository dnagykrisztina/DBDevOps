###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesReason


# ![logo](../../../../../Images/table.svg) Sales.SalesReason

## <a name="#Description"></a>Description
> Lookup table of customer purchase reasons.
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
|Row Count (~)|10|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesReason_SalesReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesReason_SalesReasonID](../../../../../Images/Cluster.svg)](#Indexes)|SalesReasonID|int|4|10|0|True|1 - 1|||False|False|Primary key for SalesReason records.|
||Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Sales reason description.|
||ReasonType|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Category the sales reason belongs to.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_SalesReason_SalesReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesReason_SalesReasonID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesReason_SalesReasonID|SalesReasonID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesReason (
  SalesReasonID int IDENTITY,
  Name dbo.Name NOT NULL,
  ReasonType dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesReason_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesReason_SalesReasonID PRIMARY KEY CLUSTERED (SalesReasonID)
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table of customer purchase reasons.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SalesReason records.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales reason description.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Category the sales reason belongs to.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'ReasonType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'INDEX', N'PK_SalesReason_SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'CONSTRAINT', N'PK_SalesReason_SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'CONSTRAINT', N'DF_SalesReason_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Sales](../Security/Schemas/Sales.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.SalesOrderHeaderSalesReason](Sales.SalesOrderHeaderSalesReason.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial