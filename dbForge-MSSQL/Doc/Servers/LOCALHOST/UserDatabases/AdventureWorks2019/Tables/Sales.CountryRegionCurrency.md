###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.CountryRegionCurrency


# ![logo](../../../../../Images/table.svg) Sales.CountryRegionCurrency

## <a name="#Description"></a>Description
> Cross-reference table mapping ISO currency codes to a country or region.
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
|Row Count (~)|109|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_CountryRegionCurrency_CountryRegion_CountryRegionCode: Person.CountryRegion](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/Cluster.svg)](#Indexes)|CountryRegionCode|nvarchar|3|0|0|True||||False|False|ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.|
|[![Primary Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_CountryRegionCurrency_Currency_CurrencyCode: Sales.Currency](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_CountryRegionCurrency_CurrencyCode](../../../../../Images/index.svg)](#Indexes)|CurrencyCode|nchar|3|0|0|True||||False|False|ISO standard currency code. Foreign key to Currency.CurrencyCode.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_CountryRegionCurrency_CurrencyCode|CurrencyCode|False||Nonclustered index.|
|[![Primary Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode](../../../../../Images/Cluster.svg)](#Indexes)|PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode|CountryRegionCode, CurrencyCode|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_CountryRegionCurrency_CountryRegion_CountryRegionCode|CountryRegionCode|Foreign key constraint referencing CountryRegion.CountryRegionCode.|
|FK_CountryRegionCurrency_Currency_CurrencyCode|CurrencyCode|Foreign key constraint referencing Currency.CurrencyCode.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.CountryRegionCurrency (
  CountryRegionCode nvarchar(3) NOT NULL,
  CurrencyCode nchar(3) NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_CountryRegionCurrency_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode PRIMARY KEY CLUSTERED (CountryRegionCode, CurrencyCode)
)
ON [PRIMARY]
GO

CREATE INDEX IX_CountryRegionCurrency_CurrencyCode
  ON Sales.CountryRegionCurrency (CurrencyCode)
  ON [PRIMARY]
GO

ALTER TABLE Sales.CountryRegionCurrency
  ADD CONSTRAINT FK_CountryRegionCurrency_CountryRegion_CountryRegionCode FOREIGN KEY (CountryRegionCode) REFERENCES Person.CountryRegion (CountryRegionCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'CONSTRAINT', N'FK_CountryRegionCurrency_CountryRegion_CountryRegionCode'
GO

ALTER TABLE Sales.CountryRegionCurrency
  ADD CONSTRAINT FK_CountryRegionCurrency_Currency_CurrencyCode FOREIGN KEY (CurrencyCode) REFERENCES Sales.Currency (CurrencyCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Currency.CurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'CONSTRAINT', N'FK_CountryRegionCurrency_Currency_CurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping ISO currency codes to a country or region.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard currency code. Foreign key to Currency.CurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'COLUMN', N'CurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'INDEX', N'IX_CountryRegionCurrency_CurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'INDEX', N'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'CONSTRAINT', N'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'CountryRegionCurrency', 'CONSTRAINT', N'DF_CountryRegionCurrency_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.CountryRegion](Person.CountryRegion.md)
- [Sales.Currency](Sales.Currency.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial