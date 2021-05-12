###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesOrderHeaderSalesReason


# ![logo](../../../../../Images/table.svg) Sales.SalesOrderHeaderSalesReason

## <a name="#Description"></a>Description
> Cross-reference table mapping sales orders to sales reason codes.
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
|Row Count (~)|27647|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID: Sales.SalesOrderHeader](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/Cluster.svg)](#Indexes)|SalesOrderID|int|4|10|0|True||||False|False|Primary key. Foreign key to SalesOrderHeader.SalesOrderID.|
|[![Primary Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID: Sales.SalesReason](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/Cluster.svg)](#Indexes)|SalesReasonID|int|4|10|0|True||||False|False|Primary key. Foreign key to SalesReason.SalesReasonID.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID|SalesOrderID, SalesReasonID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID|SalesOrderID|Foreign key constraint referencing SalesOrderHeader.SalesOrderID.|
|FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID|SalesReasonID|Foreign key constraint referencing SalesReason.SalesReasonID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesOrderHeaderSalesReason (
  SalesOrderID int NOT NULL,
  SalesReasonID int NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesOrderHeaderSalesReason_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID PRIMARY KEY CLUSTERED (SalesOrderID, SalesReasonID)
)
ON [PRIMARY]
GO

ALTER TABLE Sales.SalesOrderHeaderSalesReason
  ADD CONSTRAINT FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID FOREIGN KEY (SalesOrderID) REFERENCES Sales.SalesOrderHeader (SalesOrderID) ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesOrderHeader.SalesOrderID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'CONSTRAINT', N'FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID'
GO

ALTER TABLE Sales.SalesOrderHeaderSalesReason
  ADD CONSTRAINT FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID FOREIGN KEY (SalesReasonID) REFERENCES Sales.SalesReason (SalesReasonID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesReason.SalesReasonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'CONSTRAINT', N'FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping sales orders to sales reason codes.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'COLUMN', N'SalesOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to SalesReason.SalesReasonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'COLUMN', N'SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'INDEX', N'PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'CONSTRAINT', N'PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeaderSalesReason', 'CONSTRAINT', N'DF_SalesOrderHeaderSalesReason_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
- [Sales.SalesReason](Sales.SalesReason.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial