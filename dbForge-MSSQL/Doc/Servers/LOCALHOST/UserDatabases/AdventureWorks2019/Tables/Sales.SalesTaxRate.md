###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesTaxRate


# ![logo](../../../../../Images/table.svg) Sales.SalesTaxRate

## <a name="#Description"></a>Description
> Tax rate lookup table.
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
|Row Count (~)|29|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesTaxRate_SalesTaxRateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTaxRate_SalesTaxRateID](../../../../../Images/Cluster.svg)](#Indexes)|SalesTaxRateID|int|4|10|0|True|1 - 1|||False|False|Primary key for SalesTaxRate records.|
|[![Foreign Keys FK_SalesTaxRate_StateProvince_StateProvinceID: Person.StateProvince](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes AK_SalesTaxRate_StateProvinceID_TaxType](../../../../../Images/index.svg)](#Indexes)|StateProvinceID|int|4|10|0|True||||False|False|State, province, or country/region the sales tax applies to.|
|[![Indexes AK_SalesTaxRate_StateProvinceID_TaxType](../../../../../Images/index.svg)](#Indexes)[![Check Constraint CK_SalesTaxRate_TaxType](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|TaxType|tinyint|1|3|0|True||||False|False|1 = Tax applied to retail transactions, 2 = Tax applied to wholesale transactions, 3 = Tax applied to all sales (retail and wholesale) transactions.|
||TaxRate|smallmoney|4|10|4|True|||(0.00)|False|False|Tax rate amount.|
||Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Tax rate description.|
|[![Indexes AK_SalesTaxRate_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesTaxRate_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||AK_SalesTaxRate_StateProvinceID_TaxType|StateProvinceID, TaxType|True||Unique nonclustered index.|
|[![Primary Key PK_SalesTaxRate_SalesTaxRateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesTaxRate_SalesTaxRateID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesTaxRate_SalesTaxRateID|SalesTaxRateID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesTaxRate_TaxType|TaxType|([TaxType]>=(1) AND [TaxType]<=(3))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesTaxRate_StateProvince_StateProvinceID|StateProvinceID|Foreign key constraint referencing StateProvince.StateProvinceID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesTaxRate (
  SalesTaxRateID int IDENTITY,
  StateProvinceID int NOT NULL,
  TaxType tinyint NOT NULL,
  TaxRate smallmoney NOT NULL CONSTRAINT DF_SalesTaxRate_TaxRate DEFAULT (0.00),
  Name dbo.Name NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesTaxRate_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesTaxRate_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesTaxRate_SalesTaxRateID PRIMARY KEY CLUSTERED (SalesTaxRateID),
  CONSTRAINT CK_SalesTaxRate_TaxType CHECK ([TaxType]>=(1) AND [TaxType]<=(3))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesTaxRate_rowguid
  ON Sales.SalesTaxRate (rowguid)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesTaxRate_StateProvinceID_TaxType
  ON Sales.SalesTaxRate (StateProvinceID, TaxType)
  ON [PRIMARY]
GO

ALTER TABLE Sales.SalesTaxRate
  ADD CONSTRAINT FK_SalesTaxRate_StateProvince_StateProvinceID FOREIGN KEY (StateProvinceID) REFERENCES Person.StateProvince (StateProvinceID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing StateProvince.StateProvinceID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'FK_SalesTaxRate_StateProvince_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Tax rate lookup table.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SalesTaxRate records.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'SalesTaxRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'State, province, or country/region the sales tax applies to.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1 = Tax applied to retail transactions, 2 = Tax applied to wholesale transactions, 3 = Tax applied to all sales (retail and wholesale) transactions.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'TaxType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Tax rate amount.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'TaxRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Tax rate description.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'INDEX', N'AK_SalesTaxRate_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'INDEX', N'AK_SalesTaxRate_StateProvinceID_TaxType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'INDEX', N'PK_SalesTaxRate_SalesTaxRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'PK_SalesTaxRate_SalesTaxRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [TaxType] BETWEEN (1) AND (3)', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'CK_SalesTaxRate_TaxType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'DF_SalesTaxRate_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'DF_SalesTaxRate_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesTaxRate', 'CONSTRAINT', N'DF_SalesTaxRate_TaxRate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.StateProvince](Person.StateProvince.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial