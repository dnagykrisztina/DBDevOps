###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesTerritory


# ![logo](../../../../../Images/table.svg) Sales.SalesTerritory

## <a name="#Description"></a>Description
> Sales territory lookup table.
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
|Row Count (~)|10|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesTerritory_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTerritory_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|TerritoryID|int|4|10|0|True|1 - 1|||False|False|Primary key for SalesTerritory records.|
|[![Indexes AK_SalesTerritory_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Sales territory description|
|[![Foreign Keys FK_SalesTerritory_CountryRegion_CountryRegionCode: Person.CountryRegion](../../../../../Images/foreignkey.svg)](#ForeignKeys)|CountryRegionCode|nvarchar|3|0|0|True||||False|False|ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. |
||Group|nvarchar|50|0|0|True||||False|False|Geographic area to which the sales territory belong.|
|[![Check Constraint CK_SalesTerritory_SalesYTD](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesYTD|money|8|19|4|True|||(0.00)|False|False|Sales in the territory year to date.|
|[![Check Constraint CK_SalesTerritory_SalesLastYear](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesLastYear|money|8|19|4|True|||(0.00)|False|False|Sales in the territory the previous year.|
|[![Check Constraint CK_SalesTerritory_CostYTD](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|CostYTD|money|8|19|4|True|||(0.00)|False|False|Business costs in the territory year to date.|
|[![Check Constraint CK_SalesTerritory_CostLastYear](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|CostLastYear|money|8|19|4|True|||(0.00)|False|False|Business costs in the territory the previous year.|
|[![Indexes AK_SalesTerritory_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesTerritory_Name|Name|True||Unique nonclustered index.|
||AK_SalesTerritory_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_SalesTerritory_TerritoryID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTerritory_TerritoryID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesTerritory_TerritoryID|TerritoryID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesTerritory_CostLastYear|CostLastYear|([CostLastYear]>=(0.00))||
|CK_SalesTerritory_CostYTD|CostYTD|([CostYTD]>=(0.00))||
|CK_SalesTerritory_SalesLastYear|SalesLastYear|([SalesLastYear]>=(0.00))||
|CK_SalesTerritory_SalesYTD|SalesYTD|([SalesYTD]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesTerritory_CountryRegion_CountryRegionCode|CountryRegionCode|Foreign key constraint referencing CountryRegion.CountryRegionCode.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesTerritory (
  TerritoryID int IDENTITY,
  Name dbo.Name NOT NULL,
  CountryRegionCode nvarchar(3) NOT NULL,
  [Group] nvarchar(50) NOT NULL,
  SalesYTD money NOT NULL CONSTRAINT DF_SalesTerritory_SalesYTD DEFAULT (0.00),
  SalesLastYear money NOT NULL CONSTRAINT DF_SalesTerritory_SalesLastYear DEFAULT (0.00),
  CostYTD money NOT NULL CONSTRAINT DF_SalesTerritory_CostYTD DEFAULT (0.00),
  CostLastYear money NOT NULL CONSTRAINT DF_SalesTerritory_CostLastYear DEFAULT (0.00),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesTerritory_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesTerritory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesTerritory_TerritoryID PRIMARY KEY CLUSTERED (TerritoryID),
  CONSTRAINT CK_SalesTerritory_CostLastYear CHECK ([CostLastYear]>=(0.00)),
  CONSTRAINT CK_SalesTerritory_CostYTD CHECK ([CostYTD]>=(0.00)),
  CONSTRAINT CK_SalesTerritory_SalesLastYear CHECK ([SalesLastYear]>=(0.00)),
  CONSTRAINT CK_SalesTerritory_SalesYTD CHECK ([SalesYTD]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesTerritory_Name
  ON Sales.SalesTerritory (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesTerritory_rowguid
  ON Sales.SalesTerritory (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SalesTerritory
  ADD CONSTRAINT FK_SalesTerritory_CountryRegion_CountryRegionCode FOREIGN KEY (CountryRegionCode) REFERENCES Person.CountryRegion (CountryRegionCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'FK_SalesTerritory_CountryRegion_CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales territory lookup table.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SalesTerritory records.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales territory description', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Geographic area to which the sales territory belong.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'Group'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales in the territory year to date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'SalesYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales in the territory the previous year.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Business costs in the territory year to date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'CostYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Business costs in the territory the previous year.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'CostLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'INDEX', N'AK_SalesTerritory_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'INDEX', N'AK_SalesTerritory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'INDEX', N'PK_SalesTerritory_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'PK_SalesTerritory_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CostLastYear] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'CK_SalesTerritory_CostLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CostYTD] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'CK_SalesTerritory_CostYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesLastYear] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'CK_SalesTerritory_SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesYTD] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'CK_SalesTerritory_SalesYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_CostLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_CostYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesTerritory', 'CONSTRAINT', N'DF_SalesTerritory_SalesYTD'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.CountryRegion](Person.CountryRegion.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`7`_
- [Person.StateProvince](Person.StateProvince.md)
- [Sales.Customer](Sales.Customer.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)
- [Sales.SalesTerritoryHistory](Sales.SalesTerritoryHistory.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../Views/Sales.vSalesPersonSalesByFiscalYears.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial