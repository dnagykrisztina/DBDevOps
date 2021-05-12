###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesPerson


# ![logo](../../../../../Images/table.svg) Sales.SalesPerson

## <a name="#Description"></a>Description
> Sales representative current information.
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
|Row Count (~)|17|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesPerson_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesPerson_Employee_BusinessEntityID: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesPerson_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID|
|[![Foreign Keys FK_SalesPerson_SalesTerritory_TerritoryID: Sales.SalesTerritory](../../../../../Images/foreignkey.svg)](#ForeignKeys)|TerritoryID|int|4|10|0|False||||False|False|Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID.|
|[![Check Constraint CK_SalesPerson_SalesQuota](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesQuota|money|8|19|4|False||||False|False|Projected yearly sales.|
|[![Check Constraint CK_SalesPerson_Bonus](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Bonus|money|8|19|4|True|||(0.00)|False|False|Bonus due if quota is met.|
|[![Check Constraint CK_SalesPerson_CommissionPct](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|CommissionPct|smallmoney|4|10|4|True|||(0.00)|False|False|Commision percent received per sale.|
|[![Check Constraint CK_SalesPerson_SalesYTD](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesYTD|money|8|19|4|True|||(0.00)|False|False|Sales total year to date.|
|[![Check Constraint CK_SalesPerson_SalesLastYear](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SalesLastYear|money|8|19|4|True|||(0.00)|False|False|Sales total of previous year.|
|[![Indexes AK_SalesPerson_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesPerson_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_SalesPerson_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesPerson_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesPerson_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesPerson_Bonus|Bonus|([Bonus]>=(0.00))||
|CK_SalesPerson_CommissionPct|CommissionPct|([CommissionPct]>=(0.00))||
|CK_SalesPerson_SalesLastYear|SalesLastYear|([SalesLastYear]>=(0.00))||
|CK_SalesPerson_SalesQuota|SalesQuota|([SalesQuota]>(0.00))||
|CK_SalesPerson_SalesYTD|SalesYTD|([SalesYTD]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesPerson_Employee_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Employee.EmployeeID.|
|FK_SalesPerson_SalesTerritory_TerritoryID|TerritoryID|Foreign key constraint referencing SalesTerritory.TerritoryID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesPerson (
  BusinessEntityID int NOT NULL,
  TerritoryID int NULL,
  SalesQuota money NULL,
  Bonus money NOT NULL CONSTRAINT DF_SalesPerson_Bonus DEFAULT (0.00),
  CommissionPct smallmoney NOT NULL CONSTRAINT DF_SalesPerson_CommissionPct DEFAULT (0.00),
  SalesYTD money NOT NULL CONSTRAINT DF_SalesPerson_SalesYTD DEFAULT (0.00),
  SalesLastYear money NOT NULL CONSTRAINT DF_SalesPerson_SalesLastYear DEFAULT (0.00),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesPerson_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesPerson_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesPerson_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID),
  CONSTRAINT CK_SalesPerson_Bonus CHECK ([Bonus]>=(0.00)),
  CONSTRAINT CK_SalesPerson_CommissionPct CHECK ([CommissionPct]>=(0.00)),
  CONSTRAINT CK_SalesPerson_SalesLastYear CHECK ([SalesLastYear]>=(0.00)),
  CONSTRAINT CK_SalesPerson_SalesQuota CHECK ([SalesQuota]>(0.00)),
  CONSTRAINT CK_SalesPerson_SalesYTD CHECK ([SalesYTD]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesPerson_rowguid
  ON Sales.SalesPerson (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SalesPerson
  ADD CONSTRAINT FK_SalesPerson_Employee_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'FK_SalesPerson_Employee_BusinessEntityID'
GO

ALTER TABLE Sales.SalesPerson
  ADD CONSTRAINT FK_SalesPerson_SalesTerritory_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES Sales.SalesTerritory (TerritoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'FK_SalesPerson_SalesTerritory_TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales representative current information.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Projected yearly sales.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesQuota'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Bonus due if quota is met.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'Bonus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Commision percent received per sale.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'CommissionPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales total year to date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales total of previous year.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'INDEX', N'AK_SalesPerson_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'INDEX', N'PK_SalesPerson_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'PK_SalesPerson_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Bonus] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_Bonus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CommissionPct] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_CommissionPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesLastYear] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesQuota'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SalesYTD] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesYTD'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_Bonus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_CommissionPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_SalesLastYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_SalesYTD'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [HumanResources.Employee](HumanResources.Employee.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)


## <a name="#UsedBy"></a>Used By _`6`_
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
- [Sales.SalesPersonQuotaHistory](Sales.SalesPersonQuotaHistory.md)
- [Sales.SalesTerritoryHistory](Sales.SalesTerritoryHistory.md)
- [Sales.Store](Sales.Store.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../Views/Sales.vSalesPersonSalesByFiscalYears.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial