###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.Store


# ![logo](../../../../../Images/table.svg) Sales.Store

## <a name="#Description"></a>Description
> Customers (resellers) of Adventure Works products.
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
|Row Count (~)|701|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Store_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_Store_BusinessEntity_BusinessEntityID: Person.BusinessEntity](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_Store_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key. Foreign key to Customer.BusinessEntityID.|
||Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the store.|
|[![Foreign Keys FK_Store_SalesPerson_SalesPersonID: Sales.SalesPerson](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_Store_SalesPersonID](../../../../../Images/index.svg)](#Indexes)|SalesPersonID|int|4|10|0|False||||False|False|ID of the sales person assigned to the customer. Foreign key to SalesPerson.BusinessEntityID.|
|[![Indexes PXML_Store_Demographics](../../../../../Images/index.svg)](#Indexes)|Demographics|[Sales.StoreSurveySchemaCollection](../Programmability/Types/XmlSchemaCollection/Sales.StoreSurveySchemaCollection.md)||0|0|False||||False|False|Demographic informationg about the store such as the number of employees, annual sales and store type.|
|[![Indexes AK_Store_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Store_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_Store_SalesPersonID|SalesPersonID|False||Nonclustered index.|
|[![Primary Key PK_Store_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Store_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Store_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|
||PXML_Store_Demographics|Demographics|False||Primary XML index.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Store_BusinessEntity_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing BusinessEntity.BusinessEntityID|
|FK_Store_SalesPerson_SalesPersonID|BusinessEntityID|Foreign key constraint referencing SalesPerson.SalesPersonID|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.Store (
  BusinessEntityID int NOT NULL,
  Name dbo.Name NOT NULL,
  SalesPersonID int NULL,
  Demographics xml (CONTENT Sales.StoreSurveySchemaCollection) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Store_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Store_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Store_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX PXML_Store_Demographics
  ON Sales.Store (Demographics)
GO

CREATE UNIQUE INDEX AK_Store_rowguid
  ON Sales.Store (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_Store_SalesPersonID
  ON Sales.Store (SalesPersonID)
  ON [PRIMARY]
GO

ALTER TABLE Sales.Store
  ADD CONSTRAINT FK_Store_BusinessEntity_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.BusinessEntity (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'FK_Store_BusinessEntity_BusinessEntityID'
GO

ALTER TABLE Sales.Store
  ADD CONSTRAINT FK_Store_SalesPerson_SalesPersonID FOREIGN KEY (SalesPersonID) REFERENCES Sales.SalesPerson (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'FK_Store_SalesPerson_SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'PXML_Store_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customers (resellers) of Adventure Works products.', 'SCHEMA', N'Sales', 'TABLE', N'Store'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Customer.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the store.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ID of the sales person assigned to the customer. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Demographic informationg about the store such as the number of employees, annual sales and store type.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'AK_Store_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'IX_Store_SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'PK_Store_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'PK_Store_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'DF_Store_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'DF_Store_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`5`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.BusinessEntity](Person.BusinessEntity.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Sales.StoreSurveySchemaCollection](../Programmability/Types/XmlSchemaCollection/Sales.StoreSurveySchemaCollection.md)


## <a name="#UsedBy"></a>Used By _`5`_
- [Sales.Customer](Sales.Customer.md)
- [Sales.vStoreWithAddresses](../Views/Sales.vStoreWithAddresses.md)
- [Sales.vStoreWithContacts](../Views/Sales.vStoreWithContacts.md)
- [Sales.vStoreWithDemographics](../Views/Sales.vStoreWithDemographics.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial