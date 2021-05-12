###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.AddressType


# ![logo](../../../../../Images/table.svg) Person.AddressType

## <a name="#Description"></a>Description
> Types of addresses stored in the Address table. 
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
|Row Count (~)|6|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_AddressType_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_AddressType_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)|AddressTypeID|int|4|10|0|True|1 - 1|||False|False|Primary key for AddressType records.|
|[![Indexes AK_AddressType_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Address type description. For example, Billing, Home, or Shipping.|
|[![Indexes AK_AddressType_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_AddressType_Name|Name|True||Unique nonclustered index.|
||AK_AddressType_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_AddressType_AddressTypeID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_AddressType_AddressTypeID](../../../../../Images/Cluster.svg)](#Indexes)|PK_AddressType_AddressTypeID|AddressTypeID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.AddressType (
  AddressTypeID int IDENTITY,
  Name dbo.Name NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_AddressType_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_AddressType_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_AddressType_AddressTypeID PRIMARY KEY CLUSTERED (AddressTypeID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_AddressType_Name
  ON Person.AddressType (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_AddressType_rowguid
  ON Person.AddressType (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Types of addresses stored in the Address table. ', 'SCHEMA', N'Person', 'TABLE', N'AddressType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for AddressType records.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'COLUMN', N'AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Address type description. For example, Billing, Home, or Shipping.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'INDEX', N'AK_AddressType_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'INDEX', N'AK_AddressType_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'INDEX', N'PK_AddressType_AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'CONSTRAINT', N'PK_AddressType_AddressTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'CONSTRAINT', N'DF_AddressType_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'AddressType', 'CONSTRAINT', N'DF_AddressType_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`4`_
- [Person.BusinessEntityAddress](Person.BusinessEntityAddress.md)
- [Purchasing.vVendorWithAddresses](../Views/Purchasing.vVendorWithAddresses.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vStoreWithAddresses](../Views/Sales.vStoreWithAddresses.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial