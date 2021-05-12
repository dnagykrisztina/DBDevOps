###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesPersonQuotaHistory


# ![logo](../../../../../Images/table.svg) Sales.SalesPersonQuotaHistory

## <a name="#Description"></a>Description
> Sales performance tracking.
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
|Row Count (~)|163|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID: Sales.SalesPerson](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.|
|[![Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/Cluster.svg)](#Indexes)|QuotaDate|datetime|8|23|3|True||||False|False|Sales quota date.|
|[![Check Constraint CK_SalesPersonQuotaHistory_SalesQuota](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesQuota|money|8|19|4|True||||False|False|Sales quota amount.|
|[![Indexes AK_SalesPersonQuotaHistory_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesPersonQuotaHistory_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate|BusinessEntityID, QuotaDate|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesPersonQuotaHistory_SalesQuota|SalesQuota|([SalesQuota]>(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing SalesPerson.SalesPersonID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesPersonQuotaHistory (
  BusinessEntityID int NOT NULL,
  QuotaDate datetime NOT NULL,
  SalesQuota money NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesPersonQuotaHistory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesPersonQuotaHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate PRIMARY KEY CLUSTERED (BusinessEntityID, QuotaDate),
  CONSTRAINT CK_SalesPersonQuotaHistory_SalesQuota CHECK ([SalesQuota]>(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesPersonQuotaHistory_rowguid
  ON Sales.SalesPersonQuotaHistory (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SalesPersonQuotaHistory
  ADD CONSTRAINT FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Sales.SalesPerson (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales performance tracking.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales quota date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'QuotaDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales quota amount.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'SalesQuota'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'INDEX', N'AK_SalesPersonQuotaHistory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'INDEX', N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'CK_SalesPersonQuotaHistory_SalesQuota'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'DF_SalesPersonQuotaHistory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'DF_SalesPersonQuotaHistory_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Sales](../Security/Schemas/Sales.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial