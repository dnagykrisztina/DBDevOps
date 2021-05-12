###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.PersonPhone


# ![logo](../../../../../Images/table.svg) Person.PersonPhone

## <a name="#Description"></a>Description
> Telephone number and type of a person.
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
|[![Primary Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_PersonPhone_Person_BusinessEntityID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Business entity identification number. Foreign key to Person.BusinessEntityID.|
|[![Primary Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_PersonPhone_PhoneNumber](../../../../../Images/index.svg)](#Indexes)|PhoneNumber|[dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)|25|0|0|True||||False|False|Telephone number identification number.|
|[![Primary Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID: Person.PhoneNumberType](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PhoneNumberTypeID|int|4|10|0|True||||False|False|Kind of phone number. Foreign key to PhoneNumberType.PhoneNumberTypeID.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_PersonPhone_PhoneNumber|PhoneNumber|False||Nonclustered index.|
|[![Primary Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID|BusinessEntityID, PhoneNumber, PhoneNumberTypeID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_PersonPhone_Person_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|
|FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID|PhoneNumberTypeID|Foreign key constraint referencing PhoneNumberType.PhoneNumberTypeID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.PersonPhone (
  BusinessEntityID int NOT NULL,
  PhoneNumber dbo.Phone NOT NULL,
  PhoneNumberTypeID int NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_PersonPhone_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID PRIMARY KEY CLUSTERED (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
)
ON [PRIMARY]
GO

CREATE INDEX IX_PersonPhone_PhoneNumber
  ON Person.PersonPhone (PhoneNumber)
  ON [PRIMARY]
GO

ALTER TABLE Person.PersonPhone
  ADD CONSTRAINT FK_PersonPhone_Person_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'CONSTRAINT', N'FK_PersonPhone_Person_BusinessEntityID'
GO

ALTER TABLE Person.PersonPhone
  ADD CONSTRAINT FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID FOREIGN KEY (PhoneNumberTypeID) REFERENCES Person.PhoneNumberType (PhoneNumberTypeID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing PhoneNumberType.PhoneNumberTypeID.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'CONSTRAINT', N'FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Telephone number and type of a person.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Business entity identification number. Foreign key to Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Telephone number identification number.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'COLUMN', N'PhoneNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Kind of phone number. Foreign key to PhoneNumberType.PhoneNumberTypeID.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'COLUMN', N'PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'INDEX', N'IX_PersonPhone_PhoneNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'INDEX', N'PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'CONSTRAINT', N'PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'PersonPhone', 'CONSTRAINT', N'DF_PersonPhone_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Person](../Security/Schemas/Person.md)
- [Person.Person](Person.Person.md)
- [Person.PhoneNumberType](Person.PhoneNumberType.md)
- [dbo.Phone](../Programmability/Types/UserDefinedDataTypes/dbo.Phone.md)


## <a name="#UsedBy"></a>Used By _`5`_
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [Purchasing.vVendorWithContacts](../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithContacts](../Views/Sales.vStoreWithContacts.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial