###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.BusinessEntity


# ![logo](../../../../../Images/table.svg) Person.BusinessEntity

## <a name="#Description"></a>Description
> Source of the ID that connects vendors, customers, and employees with address and contact information.
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
|Row Count (~)|20777|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_BusinessEntity_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_BusinessEntity_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True|1 - 1|||False|False|Primary key for all customers, vendors, and employees.|
|[![Indexes AK_BusinessEntity_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_BusinessEntity_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_BusinessEntity_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_BusinessEntity_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_BusinessEntity_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.BusinessEntity (
  BusinessEntityID int IDENTITY NOT FOR REPLICATION,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_BusinessEntity_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_BusinessEntity_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_BusinessEntity_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_BusinessEntity_rowguid
  ON Person.BusinessEntity (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Source of the ID that connects vendors, customers, and employees with address and contact information.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for all customers, vendors, and employees.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'INDEX', N'AK_BusinessEntity_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'INDEX', N'PK_BusinessEntity_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'CONSTRAINT', N'PK_BusinessEntity_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'CONSTRAINT', N'DF_BusinessEntity_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntity', 'CONSTRAINT', N'DF_BusinessEntity_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Person](../Security/Schemas/Person.md)


## <a name="#UsedBy"></a>Used By _`5`_
- [Person.BusinessEntityAddress](Person.BusinessEntityAddress.md)
- [Person.BusinessEntityContact](Person.BusinessEntityContact.md)
- [Person.Person](Person.Person.md)
- [Purchasing.Vendor](Purchasing.Vendor.md)
- [Sales.Store](Sales.Store.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial