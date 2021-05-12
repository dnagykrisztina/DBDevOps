###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.EmailAddress


# ![logo](../../../../../Images/table.svg) Person.EmailAddress

## <a name="#Description"></a>Description
> Where to send a person email.
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
|Row Count (~)|19972|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_EmailAddress_Person_BusinessEntityID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. Person associated with this email address.  Foreign key to Person.BusinessEntityID|
|[![Primary Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/Cluster.svg)](#Indexes)|EmailAddressID|int|4|10|0|True|1 - 1|||False|False|Primary key. ID of this email address.|
|[![Indexes IX_EmailAddress_EmailAddress](../../../../../Images/index.svg)](#Indexes)|EmailAddress|nvarchar|50|0|0|False||||False|False|E-mail address for the person.|
||rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_EmailAddress_EmailAddress|EmailAddress|False||Nonclustered index.|
|[![Primary Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmailAddress_BusinessEntityID_EmailAddressID](../../../../../Images/Cluster.svg)](#Indexes)|PK_EmailAddress_BusinessEntityID_EmailAddressID|BusinessEntityID, EmailAddressID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_EmailAddress_Person_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.EmailAddress (
  BusinessEntityID int NOT NULL,
  EmailAddressID int IDENTITY,
  EmailAddress nvarchar(50) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_EmailAddress_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_EmailAddress_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_EmailAddress_BusinessEntityID_EmailAddressID PRIMARY KEY CLUSTERED (BusinessEntityID, EmailAddressID)
)
ON [PRIMARY]
GO

CREATE INDEX IX_EmailAddress_EmailAddress
  ON Person.EmailAddress (EmailAddress)
  ON [PRIMARY]
GO

ALTER TABLE Person.EmailAddress
  ADD CONSTRAINT FK_EmailAddress_Person_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'CONSTRAINT', N'FK_EmailAddress_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Where to send a person email.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Person associated with this email address.  Foreign key to Person.BusinessEntityID', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. ID of this email address.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'EmailAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'E-mail address for the person.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'INDEX', N'IX_EmailAddress_EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'INDEX', N'PK_EmailAddress_BusinessEntityID_EmailAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'CONSTRAINT', N'PK_EmailAddress_BusinessEntityID_EmailAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'CONSTRAINT', N'DF_EmailAddress_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'CONSTRAINT', N'DF_EmailAddress_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [Person.Person](Person.Person.md)


## <a name="#UsedBy"></a>Used By _`6`_
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [Person.vAdditionalContactInfo](../Views/Person.vAdditionalContactInfo.md)
- [Purchasing.vVendorWithContacts](../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithContacts](../Views/Sales.vStoreWithContacts.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial