###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.StateProvince


# ![logo](../../../../../Images/table.svg) Person.StateProvince

## <a name="#Description"></a>Description
> State and province lookup table.
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
|Row Count (~)|181|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_StateProvince_StateProvinceID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_StateProvince_StateProvinceID](../../../../../Images/Cluster.svg)](#Indexes)|StateProvinceID|int|4|10|0|True|1 - 1|||False|False|Primary key for StateProvince records.|
|[![Indexes AK_StateProvince_StateProvinceCode_CountryRegionCode](../../../../../Images/index.svg)](#Indexes)|StateProvinceCode|nchar|3|0|0|True||||False|False|ISO standard state or province code.|
|[![Foreign Keys FK_StateProvince_CountryRegion_CountryRegionCode: Person.CountryRegion](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes AK_StateProvince_StateProvinceCode_CountryRegionCode](../../../../../Images/index.svg)](#Indexes)|CountryRegionCode|nvarchar|3|0|0|True||||False|False|ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. |
||IsOnlyStateProvinceFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.|
|[![Indexes AK_StateProvince_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|State or province description.|
|[![Foreign Keys FK_StateProvince_SalesTerritory_TerritoryID: Sales.SalesTerritory](../../../../../Images/foreignkey.svg)](#ForeignKeys)|TerritoryID|int|4|10|0|True||||False|False|ID of the territory in which the state or province is located. Foreign key to SalesTerritory.SalesTerritoryID.|
|[![Indexes AK_StateProvince_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_StateProvince_Name|Name|True||Unique nonclustered index.|
||AK_StateProvince_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||AK_StateProvince_StateProvinceCode_CountryRegionCode|StateProvinceCode, CountryRegionCode|True||Unique nonclustered index.|
|[![Primary Key PK_StateProvince_StateProvinceID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_StateProvince_StateProvinceID](../../../../../Images/Cluster.svg)](#Indexes)|PK_StateProvince_StateProvinceID|StateProvinceID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_StateProvince_CountryRegion_CountryRegionCode|CountryRegionCode|Foreign key constraint referencing CountryRegion.CountryRegionCode.|
|FK_StateProvince_SalesTerritory_TerritoryID|TerritoryID|Foreign key constraint referencing SalesTerritory.TerritoryID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.StateProvince (
  StateProvinceID int IDENTITY,
  StateProvinceCode nchar(3) NOT NULL,
  CountryRegionCode nvarchar(3) NOT NULL,
  IsOnlyStateProvinceFlag dbo.Flag NOT NULL CONSTRAINT DF_StateProvince_IsOnlyStateProvinceFlag DEFAULT (1),
  Name dbo.Name NOT NULL,
  TerritoryID int NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_StateProvince_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_StateProvince_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_StateProvince_StateProvinceID PRIMARY KEY CLUSTERED (StateProvinceID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_StateProvince_Name
  ON Person.StateProvince (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_StateProvince_rowguid
  ON Person.StateProvince (rowguid)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_StateProvince_StateProvinceCode_CountryRegionCode
  ON Person.StateProvince (StateProvinceCode, CountryRegionCode)
  ON [PRIMARY]
GO

ALTER TABLE Person.StateProvince
  ADD CONSTRAINT FK_StateProvince_CountryRegion_CountryRegionCode FOREIGN KEY (CountryRegionCode) REFERENCES Person.CountryRegion (CountryRegionCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'FK_StateProvince_CountryRegion_CountryRegionCode'
GO

ALTER TABLE Person.StateProvince
  ADD CONSTRAINT FK_StateProvince_SalesTerritory_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES Sales.SalesTerritory (TerritoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'FK_StateProvince_SalesTerritory_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'State and province lookup table.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for StateProvince records.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard state or province code.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'StateProvinceCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'IsOnlyStateProvinceFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'State or province description.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ID of the territory in which the state or province is located. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'INDEX', N'AK_StateProvince_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'INDEX', N'AK_StateProvince_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'INDEX', N'AK_StateProvince_StateProvinceCode_CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'INDEX', N'PK_StateProvince_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'PK_StateProvince_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'DF_StateProvince_IsOnlyStateProvinceFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'DF_StateProvince_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'CONSTRAINT', N'DF_StateProvince_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`5`_
- [Person](../Security/Schemas/Person.md)
- [Person.CountryRegion](Person.CountryRegion.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`9`_
- [Person.Address](Person.Address.md)
- [Sales.SalesTaxRate](Sales.SalesTaxRate.md)
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [Person.vAdditionalContactInfo](../Views/Person.vAdditionalContactInfo.md)
- [Person.vStateProvinceCountryRegion](../Views/Person.vStateProvinceCountryRegion.md)
- [Purchasing.vVendorWithAddresses](../Views/Purchasing.vVendorWithAddresses.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithAddresses](../Views/Sales.vStoreWithAddresses.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial