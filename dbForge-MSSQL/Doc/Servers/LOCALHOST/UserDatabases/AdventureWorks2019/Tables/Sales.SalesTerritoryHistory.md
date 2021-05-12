###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesTerritoryHistory


# ![logo](../../../../../Images/table.svg) Sales.SalesTerritoryHistory

## <a name="#Description"></a>Description
> Sales representative transfers to other sales territories.
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
|Row Count (~)|17|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID: Sales.SalesPerson](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. The sales rep.  Foreign key to SalesPerson.BusinessEntityID.|
|[![Primary Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesTerritoryHistory_SalesTerritory_TerritoryID: Sales.SalesTerritory](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|TerritoryID|int|4|10|0|True||||False|False|Primary key. Territory identification number. Foreign key to SalesTerritory.SalesTerritoryID.|
|[![Primary Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|StartDate|datetime|8|23|3|True||||False|False|Primary key. Date the sales representive started work in the territory.|
||EndDate|datetime|8|23|3|False||||False|False|Date the sales representative left work in the territory.|
|[![Indexes AK_SalesTerritoryHistory_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesTerritoryHistory_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID|BusinessEntityID, StartDate, TerritoryID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesTerritoryHistory_EndDate||([EndDate]>=[StartDate] OR [EndDate] IS NULL)||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing SalesPerson.SalesPersonID.|
|FK_SalesTerritoryHistory_SalesTerritory_TerritoryID|TerritoryID|Foreign key constraint referencing SalesTerritory.TerritoryID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesTerritoryHistory (
  BusinessEntityID int NOT NULL,
  TerritoryID int NOT NULL,
  StartDate datetime NOT NULL,
  EndDate datetime NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesTerritoryHistory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesTerritoryHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID PRIMARY KEY CLUSTERED (BusinessEntityID, StartDate, TerritoryID),
  CONSTRAINT CK_SalesTerritoryHistory_EndDate CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesTerritoryHistory_rowguid
  ON Sales.SalesTerritoryHistory (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SalesTerritoryHistory
  ADD CONSTRAINT FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Sales.SalesPerson (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID'
GO

ALTER TABLE Sales.SalesTerritoryHistory
  ADD CONSTRAINT FK_SalesTerritoryHistory_SalesTerritory_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES Sales.SalesTerritory (TerritoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'FK_SalesTerritoryHistory_SalesTerritory_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales representative transfers to other sales territories.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. The sales rep.  Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Territory identification number. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Date the sales representive started work in the territory.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the sales representative left work in the territory.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'INDEX', N'AK_SalesTerritoryHistory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'INDEX', N'PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'CK_SalesTerritoryHistory_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'DF_SalesTerritoryHistory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritoryHistory', 'CONSTRAINT', N'DF_SalesTerritoryHistory_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial