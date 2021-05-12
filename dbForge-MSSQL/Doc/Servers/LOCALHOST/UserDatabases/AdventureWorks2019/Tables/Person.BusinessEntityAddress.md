###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.BusinessEntityAddress


# ![logo](../../../../../Images/table.svg) Person.BusinessEntityAddress

## <a name="#Description"></a>Description
> Cross-reference table mapping customers, vendors, and employees to their addresses.
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
|Row Count (~)|19614|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID: Person.BusinessEntity](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. Foreign key to BusinessEntity.BusinessEntityID.|
|[![Primary Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityAddress_Address_AddressID: Person.Address](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_BusinessEntityAddress_AddressID](../../../../../Images/index.svg)](#Indexes)|AddressID|int|4|10|0|True||||False|False|Primary key. Foreign key to Address.AddressID.|
|[![Primary Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityAddress_AddressType_AddressTypeID: Person.AddressType](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_BusinessEntityAddress_AddressTypeID](../../../../../Images/index.svg)](#Indexes)|AddressTypeID|int|4|10|0|True||||False|False|Primary key. Foreign key to AddressType.AddressTypeID.|
|[![Indexes AK_BusinessEntityAddress_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_BusinessEntityAddress_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_BusinessEntityAddress_AddressID|AddressID|False||Nonclustered index.|
||IX_BusinessEntityAddress_AddressTypeID|AddressTypeID|False||Nonclustered index.|
|[![Primary Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID|BusinessEntityID, AddressID, AddressTypeID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_BusinessEntityAddress_Address_AddressID|AddressID|Foreign key constraint referencing Address.AddressID.|
|FK_BusinessEntityAddress_AddressType_AddressTypeID|AddressTypeID|Foreign key constraint referencing AddressType.AddressTypeID.|
|FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing BusinessEntity.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.BusinessEntityAddress (
  BusinessEntityID int NOT NULL,
  AddressID int NOT NULL,
  AddressTypeID int NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_BusinessEntityAddress_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_BusinessEntityAddress_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID PRIMARY KEY CLUSTERED (BusinessEntityID, AddressID, AddressTypeID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_BusinessEntityAddress_rowguid
  ON Person.BusinessEntityAddress (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_BusinessEntityAddress_AddressID
  ON Person.BusinessEntityAddress (AddressID)
  ON [PRIMARY]
GO

CREATE INDEX IX_BusinessEntityAddress_AddressTypeID
  ON Person.BusinessEntityAddress (AddressTypeID)
  ON [PRIMARY]
GO

ALTER TABLE Person.BusinessEntityAddress
  ADD CONSTRAINT FK_BusinessEntityAddress_Address_AddressID FOREIGN KEY (AddressID) REFERENCES Person.Address (AddressID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Address.AddressID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'FK_BusinessEntityAddress_Address_AddressID'
GO

ALTER TABLE Person.BusinessEntityAddress
  ADD CONSTRAINT FK_BusinessEntityAddress_AddressType_AddressTypeID FOREIGN KEY (AddressTypeID) REFERENCES Person.AddressType (AddressTypeID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing AddressType.AddressTypeID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'FK_BusinessEntityAddress_AddressType_AddressTypeID'
GO

ALTER TABLE Person.BusinessEntityAddress
  ADD CONSTRAINT FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.BusinessEntity (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping customers, vendors, and employees to their addresses.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Address.AddressID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'COLUMN', N'AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to AddressType.AddressTypeID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'COLUMN', N'AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'INDEX', N'AK_BusinessEntityAddress_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'INDEX', N'IX_BusinessEntityAddress_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'INDEX', N'IX_BusinessEntityAddress_AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'INDEX', N'PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'DF_BusinessEntityAddress_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityAddress', 'CONSTRAINT', N'DF_BusinessEntityAddress_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Person](../Security/Schemas/Person.md)
- [Person.Address](Person.Address.md)
- [Person.AddressType](Person.AddressType.md)
- [Person.BusinessEntity](Person.BusinessEntity.md)


## <a name="#UsedBy"></a>Used By _`5`_
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [Purchasing.vVendorWithAddresses](../Views/Purchasing.vVendorWithAddresses.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithAddresses](../Views/Sales.vStoreWithAddresses.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial