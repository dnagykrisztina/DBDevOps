###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.Customer


# ![logo](../../../../../Images/table.svg) Sales.Customer

## <a name="#Description"></a>Description
> Current customer information. Also see the Person and Store tables.
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
|Row Count (~)|19820|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Customer_CustomerID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Customer_CustomerID](../../../../../Images/Cluster.svg)](#Indexes)|CustomerID|int|4|10|0|True|1 - 1|||False|False|Primary key.|
|[![Foreign Keys FK_Customer_Person_PersonID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)|PersonID|int|4|10|0|False||||False|False|Foreign key to Person.BusinessEntityID|
|[![Foreign Keys FK_Customer_Store_StoreID: Sales.Store](../../../../../Images/foreignkey.svg)](#ForeignKeys)|StoreID|int|4|10|0|False||||False|False|Foreign key to Store.BusinessEntityID|
|[![Foreign Keys FK_Customer_SalesTerritory_TerritoryID: Sales.SalesTerritory](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_Customer_TerritoryID](../../../../../Images/index.svg)](#Indexes)|TerritoryID|int|4|10|0|False||||False|False|ID of the territory in which the customer is located. Foreign key to SalesTerritory.SalesTerritoryID.|
|[![Indexes AK_Customer_AccountNumber](../../../../../Images/index.svg)](#Indexes)|AccountNumber|varchar|10|0|0|True||||True|False|Unique number identifying the customer assigned by the accounting system.|
|[![Indexes AK_Customer_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|AccountNumber|(isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),''))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Customer_AccountNumber|AccountNumber|True||Unique nonclustered index.|
||AK_Customer_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_Customer_TerritoryID|TerritoryID|False||Nonclustered index.|
|[![Primary Key PK_Customer_CustomerID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Customer_CustomerID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Customer_CustomerID|CustomerID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Customer_Person_PersonID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|
|FK_Customer_SalesTerritory_TerritoryID|TerritoryID|Foreign key constraint referencing SalesTerritory.TerritoryID.|
|FK_Customer_Store_StoreID|BusinessEntityID|Foreign key constraint referencing Store.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.Customer (
  CustomerID int IDENTITY NOT FOR REPLICATION,
  PersonID int NULL,
  StoreID int NULL,
  TerritoryID int NULL,
  AccountNumber AS (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),'')),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Customer_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Customer_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Customer_CustomerID PRIMARY KEY CLUSTERED (CustomerID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Customer_AccountNumber
  ON Sales.Customer (AccountNumber)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Customer_rowguid
  ON Sales.Customer (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_Customer_TerritoryID
  ON Sales.Customer (TerritoryID)
  ON [PRIMARY]
GO

ALTER TABLE Sales.Customer
  ADD CONSTRAINT FK_Customer_Person_PersonID FOREIGN KEY (PersonID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'FK_Customer_Person_PersonID'
GO

ALTER TABLE Sales.Customer
  ADD CONSTRAINT FK_Customer_SalesTerritory_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES Sales.SalesTerritory (TerritoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'FK_Customer_SalesTerritory_TerritoryID'
GO

ALTER TABLE Sales.Customer
  ADD CONSTRAINT FK_Customer_Store_StoreID FOREIGN KEY (StoreID) REFERENCES Sales.Store (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Store.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'FK_Customer_Store_StoreID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Current customer information. Also see the Person and Store tables.', 'SCHEMA', N'Sales', 'TABLE', N'Customer'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key to Person.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'PersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key to Store.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'StoreID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ID of the territory in which the customer is located. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique number identifying the customer assigned by the accounting system.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'INDEX', N'AK_Customer_AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'INDEX', N'AK_Customer_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'INDEX', N'IX_Customer_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'INDEX', N'PK_Customer_CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'PK_Customer_CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`5`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.Person](Person.Person.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)
- [Sales.Store](Sales.Store.md)
- [dbo.ufnLeadingZeros](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnLeadingZeros.md)


## <a name="#UsedBy"></a>Used By _`4`_
- [Sales.SalesOrderDetail](Sales.SalesOrderDetail.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial