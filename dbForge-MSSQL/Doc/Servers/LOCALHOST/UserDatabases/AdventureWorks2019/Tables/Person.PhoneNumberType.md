###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.PhoneNumberType


# ![logo](../../../../../Images/table.svg) Person.PhoneNumberType

## <a name="#Description"></a>Description
> Type of phone number of a person.
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
|Row Count (~)|3|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_PhoneNumberType_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PhoneNumberType_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PhoneNumberTypeID|int|4|10|0|True|1 - 1|||False|False|Primary key for telephone number type records.|
||Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the telephone number type|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_PhoneNumberType_PhoneNumberTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PhoneNumberType_PhoneNumberTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PK_PhoneNumberType_PhoneNumberTypeID|PhoneNumberTypeID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.PhoneNumberType (
  PhoneNumberTypeID int IDENTITY,
  Name dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_PhoneNumberType_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_PhoneNumberType_PhoneNumberTypeID PRIMARY KEY CLUSTERED (PhoneNumberTypeID)
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Type of phone number of a person.', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for telephone number type records.', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'COLUMN', N'PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the telephone number type', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'INDEX', N'PK_PhoneNumberType_PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'CONSTRAINT', N'PK_PhoneNumberType_PhoneNumberTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'PhoneNumberType', 'CONSTRAINT', N'DF_PhoneNumberType_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`6`_
- [Person.PersonPhone](Person.PersonPhone.md)
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