###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.BusinessEntityContact


# ![logo](../../../../../Images/table.svg) Person.BusinessEntityContact

## <a name="#Description"></a>Description
> Cross-reference table mapping stores, vendors, and employees to people
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
|Row Count (~)|909|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityContact_BusinessEntity_BusinessEntityID: Person.BusinessEntity](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. Foreign key to BusinessEntity.BusinessEntityID.|
|[![Primary Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityContact_Person_PersonID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_BusinessEntityContact_PersonID](../../../../../Images/index.svg)](#Indexes)|PersonID|int|4|10|0|True||||False|False|Primary key. Foreign key to Person.BusinessEntityID.|
|[![Primary Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_BusinessEntityContact_ContactType_ContactTypeID: Person.ContactType](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_BusinessEntityContact_ContactTypeID](../../../../../Images/index.svg)](#Indexes)|ContactTypeID|int|4|10|0|True||||False|False|Primary key.  Foreign key to ContactType.ContactTypeID.|
|[![Indexes AK_BusinessEntityContact_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_BusinessEntityContact_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_BusinessEntityContact_ContactTypeID|ContactTypeID|False||Nonclustered index.|
||IX_BusinessEntityContact_PersonID|PersonID|False||Nonclustered index.|
|[![Primary Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID|BusinessEntityID, PersonID, ContactTypeID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_BusinessEntityContact_BusinessEntity_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing BusinessEntity.BusinessEntityID.|
|FK_BusinessEntityContact_ContactType_ContactTypeID|ContactTypeID|Foreign key constraint referencing ContactType.ContactTypeID.|
|FK_BusinessEntityContact_Person_PersonID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.BusinessEntityContact (
  BusinessEntityID int NOT NULL,
  PersonID int NOT NULL,
  ContactTypeID int NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_BusinessEntityContact_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_BusinessEntityContact_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID PRIMARY KEY CLUSTERED (BusinessEntityID, PersonID, ContactTypeID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_BusinessEntityContact_rowguid
  ON Person.BusinessEntityContact (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_BusinessEntityContact_ContactTypeID
  ON Person.BusinessEntityContact (ContactTypeID)
  ON [PRIMARY]
GO

CREATE INDEX IX_BusinessEntityContact_PersonID
  ON Person.BusinessEntityContact (PersonID)
  ON [PRIMARY]
GO

ALTER TABLE Person.BusinessEntityContact
  ADD CONSTRAINT FK_BusinessEntityContact_BusinessEntity_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.BusinessEntity (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'FK_BusinessEntityContact_BusinessEntity_BusinessEntityID'
GO

ALTER TABLE Person.BusinessEntityContact
  ADD CONSTRAINT FK_BusinessEntityContact_ContactType_ContactTypeID FOREIGN KEY (ContactTypeID) REFERENCES Person.ContactType (ContactTypeID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ContactType.ContactTypeID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'FK_BusinessEntityContact_ContactType_ContactTypeID'
GO

ALTER TABLE Person.BusinessEntityContact
  ADD CONSTRAINT FK_BusinessEntityContact_Person_PersonID FOREIGN KEY (PersonID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'FK_BusinessEntityContact_Person_PersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping stores, vendors, and employees to people', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'COLUMN', N'PersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key.  Foreign key to ContactType.ContactTypeID.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'COLUMN', N'ContactTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'INDEX', N'AK_BusinessEntityContact_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'INDEX', N'IX_BusinessEntityContact_ContactTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'INDEX', N'IX_BusinessEntityContact_PersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'INDEX', N'PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'DF_BusinessEntityContact_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'BusinessEntityContact', 'CONSTRAINT', N'DF_BusinessEntityContact_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Person](../Security/Schemas/Person.md)
- [Person.BusinessEntity](Person.BusinessEntity.md)
- [Person.ContactType](Person.ContactType.md)
- [Person.Person](Person.Person.md)


## <a name="#UsedBy"></a>Used By _`3`_
- [Purchasing.vVendorWithContacts](../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vStoreWithContacts](../Views/Sales.vStoreWithContacts.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial