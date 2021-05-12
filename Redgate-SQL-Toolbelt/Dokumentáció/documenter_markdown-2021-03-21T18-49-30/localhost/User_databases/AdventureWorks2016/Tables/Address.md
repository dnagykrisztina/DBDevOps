#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Person.Address

# ![Tables](../../../../Images/Table32.png) [Person].[Address]

---

## <a name="#description"></a>MS_Description

Street address information for customers, employees, and vendors.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 19614 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Identity Replication | Default | Description |
|---|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Address_AddressID: AddressID](../../../../Images/pkcluster.png)](#indexes) | AddressID | int | 4 | NOT NULL | 1 - 1 | NO |  | _Primary key for Address records._ |
| [![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../Images/Index.png)](#indexes) | AddressLine1 | nvarchar(60) | 120 | NOT NULL |  |  |  | _First street address line._ |
| [![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../Images/Index.png)](#indexes) | AddressLine2 | nvarchar(60) | 120 | NULL allowed |  |  |  | _Second street address line._ |
| [![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../Images/Index.png)](#indexes) | City | nvarchar(30) | 60 | NOT NULL |  |  |  | _Name of the city._ |
| [![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode
IX_Address_StateProvinceID](../../../../Images/Index.png)](#indexes)(2)[![Foreign Keys FK_Address_StateProvince_StateProvinceID: [Person].[StateProvince].StateProvinceID](../../../../Images/fk.png)](#foreignkeys) | StateProvinceID | int | 4 | NOT NULL |  |  |  | _Unique identification number for the state or province. Foreign key to StateProvince table._ |
| [![Indexes IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode](../../../../Images/Index.png)](#indexes) | PostalCode | nvarchar(15) | 30 | NOT NULL |  |  |  | _Postal code for the street address._ |
|  | SpatialLocation | geography | max | NULL allowed |  |  |  | _Latitude and longitude of this address._ |
| [![Indexes AK_Address_rowguid](../../../../Images/Index.png)](#indexes) | rowguid | uniqueidentifier | 16 | NOT NULL |  |  | (newid()) | _ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_Address_AddressID: AddressID](../../../../Images/pkcluster.png)](#indexes) | PK_Address_AddressID | AddressID | YES | _Primary key (clustered) constraint_ |
|  | AK_Address_rowguid | rowguid | YES | _Unique nonclustered index. Used to support replication samples._ |
|  | IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode | AddressLine1, AddressLine2, City, StateProvinceID, PostalCode | YES | _Nonclustered index._ |
|  | IX_Address_StateProvinceID | StateProvinceID |  | _Nonclustered index._ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_Address_StateProvince_StateProvinceID | StateProvinceID->[[Person].[StateProvince].[StateProvinceID]](StateProvince.md) | _Foreign key constraint referencing StateProvince.StateProvinceID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Person].[Address]
(
[AddressID] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AddressLine1] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressLine2] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvinceID] [int] NOT NULL,
[PostalCode] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SpatialLocation] [sys].[geography] NULL,
[rowguid] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Address] ADD CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED  ([AddressID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] ON [Person].[Address] ([AddressLine1], [AddressLine2], [City], [StateProvinceID], [PostalCode]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Address_rowguid] ON [Person].[Address] ([rowguid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Address_StateProvinceID] ON [Person].[Address] ([StateProvinceID]) ON [PRIMARY]
GO
ALTER TABLE [Person].[Address] ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Street address information for customers, employees, and vendors.', 'SCHEMA', N'Person', 'TABLE', N'Address', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for Address records.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'First street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Second street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Name of the city.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'City'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Postal code for the street address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'PostalCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Latitude and longitude of this address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'SpatialLocation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique identification number for the state or province. Foreign key to StateProvince table.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'StateProvinceID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing StateProvince.StateProvinceID.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'FK_Address_StateProvince_StateProvinceID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'PK_Address_AddressID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'AK_Address_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_StateProvinceID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'PK_Address_AddressID'
GO

```


---

## <a name="#uses"></a>Uses

* [[Person].[StateProvince]](StateProvince.md)
* [Person](../Security/Schemas/Person.md)


---

## <a name="#usedby"></a>Used By

* [[Person].[BusinessEntityAddress]](BusinessEntityAddress.md)
* [[Sales].[SalesOrderHeader]](SalesOrderHeader.md)
* [[HumanResources].[vEmployee]](../Views/vEmployee.md)
* [[Purchasing].[vVendorWithAddresses]](../Views/vVendorWithAddresses.md)
* [[Sales].[vIndividualCustomer]](../Views/vIndividualCustomer.md)
* [[Sales].[vSalesPerson]](../Views/vSalesPerson.md)
* [[Sales].[vStoreWithAddresses]](../Views/vStoreWithAddresses.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

