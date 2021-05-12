###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.Address


# ![logo](../../../../../Images/table.svg) Person.Address

## <a name="#Description"></a>Description
> Street address information for customers, employees, and vendors.
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
|[![Primary Key PK_Address_AddressID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Address_AddressID](../../../../../Images/Cluster.svg)](#Indexes)|AddressID|int|4|10|0|True|1 - 1|||False|False|Primary key for Address records.|
|[![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../../Images/index.svg)](#Indexes)|AddressLine1|nvarchar|60|0|0|True||||False|False|First street address line.|
|[![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../../Images/index.svg)](#Indexes)|AddressLine2|nvarchar|60|0|0|False||||False|False|Second street address line.|
|[![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../../Images/index.svg)](#Indexes)|City|nvarchar|30|0|0|True||||False|False|Name of the city.|
|[![Foreign Keys FK_Address_StateProvince_StateProvinceID: Person.StateProvince](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCodeIX_Address_StateProvinceID](../../../../../Images/index.svg)](#Indexes)|StateProvinceID|int|4|10|0|True||||False|False|Unique identification number for the state or province. Foreign key to StateProvince table.|
|[![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../../Images/index.svg)](#Indexes)|PostalCode|nvarchar|15|0|0|True||||False|False|Postal code for the street address.|
||SpatialLocation|geography||0|0|False||||False|False|Latitude and longitude of this address.|
|[![Indexes AK_Address_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Address_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode|AddressLine1, AddressLine2, City, StateProvinceID, PostalCode|True||Nonclustered index.|
||IX_Address_StateProvinceID|StateProvinceID|False||Nonclustered index.|
|[![Primary Key PK_Address_AddressID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Address_AddressID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Address_AddressID|AddressID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Address_StateProvince_StateProvinceID|StateProvinceID|Foreign key constraint referencing StateProvince.StateProvinceID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.Address (
  AddressID int IDENTITY NOT FOR REPLICATION,
  AddressLine1 nvarchar(60) NOT NULL,
  AddressLine2 nvarchar(60) NULL,
  City nvarchar(30) NOT NULL,
  StateProvinceID int NOT NULL,
  PostalCode nvarchar(15) NOT NULL,
  SpatialLocation geography NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Address_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Address_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Address_AddressID PRIMARY KEY CLUSTERED (AddressID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Address_rowguid
  ON Person.Address (rowguid)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode
  ON Person.Address (AddressLine1, AddressLine2, City, StateProvinceID, PostalCode)
  ON [PRIMARY]
GO

CREATE INDEX IX_Address_StateProvinceID
  ON Person.Address (StateProvinceID)
  ON [PRIMARY]
GO

ALTER TABLE Person.Address
  ADD CONSTRAINT FK_Address_StateProvince_StateProvinceID FOREIGN KEY (StateProvinceID) REFERENCES Person.StateProvince (StateProvinceID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing StateProvince.StateProvinceID.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'FK_Address_StateProvince_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Street address information for customers, employees, and vendors.', 'SCHEMA', N'Person', 'TABLE', N'Address'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Address records.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'First street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine1'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Second street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine2'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the city.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'City'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique identification number for the state or province. Foreign key to StateProvince table.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Postal code for the street address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Latitude and longitude of this address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'SpatialLocation'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'AK_Address_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'PK_Address_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'PK_Address_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [Person.StateProvince](Person.StateProvince.md)


## <a name="#UsedBy"></a>Used By _`7`_
- [Person.BusinessEntityAddress](Person.BusinessEntityAddress.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
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