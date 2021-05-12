###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.CurrencyRate


# ![logo](../../../../../Images/table.svg) Sales.CurrencyRate

## <a name="#Description"></a>Description
> Currency exchange rates.
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
|Row Count (~)|13532|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_CurrencyRate_CurrencyRateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CurrencyRate_CurrencyRateID](../../../../../Images/Cluster.svg)](#Indexes)|CurrencyRateID|int|4|10|0|True|1 - 1|||False|False|Primary key for CurrencyRate records.|
|[![Indexes AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode](../../../../../Images/index.svg)](#Indexes)|CurrencyRateDate|datetime|8|23|3|True||||False|False|Date and time the exchange rate was obtained.|
|[![Foreign Keys FK_CurrencyRate_Currency_FromCurrencyCode: Sales.Currency](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode](../../../../../Images/index.svg)](#Indexes)|FromCurrencyCode|nchar|3|0|0|True||||False|False|Exchange rate was converted from this currency code.|
|[![Foreign Keys FK_CurrencyRate_Currency_ToCurrencyCode: Sales.Currency](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode](../../../../../Images/index.svg)](#Indexes)|ToCurrencyCode|nchar|3|0|0|True||||False|False|Exchange rate was converted to this currency code.|
||AverageRate|money|8|19|4|True||||False|False|Average exchange rate for the day.|
||EndOfDayRate|money|8|19|4|True||||False|False|Final exchange rate for the day.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode|CurrencyRateDate, FromCurrencyCode, ToCurrencyCode|True||Unique nonclustered index.|
|[![Primary Key PK_CurrencyRate_CurrencyRateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CurrencyRate_CurrencyRateID](../../../../../Images/Cluster.svg)](#Indexes)|PK_CurrencyRate_CurrencyRateID|CurrencyRateID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_CurrencyRate_Currency_FromCurrencyCode|CurrencyCode|Foreign key constraint referencing Currency.FromCurrencyCode.|
|FK_CurrencyRate_Currency_ToCurrencyCode|CurrencyCode|Foreign key constraint referencing Currency.ToCurrencyCode.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.CurrencyRate (
  CurrencyRateID int IDENTITY,
  CurrencyRateDate datetime NOT NULL,
  FromCurrencyCode nchar(3) NOT NULL,
  ToCurrencyCode nchar(3) NOT NULL,
  AverageRate money NOT NULL,
  EndOfDayRate money NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_CurrencyRate_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_CurrencyRate_CurrencyRateID PRIMARY KEY CLUSTERED (CurrencyRateID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode
  ON Sales.CurrencyRate (CurrencyRateDate, FromCurrencyCode, ToCurrencyCode)
  ON [PRIMARY]
GO

ALTER TABLE Sales.CurrencyRate
  ADD CONSTRAINT FK_CurrencyRate_Currency_FromCurrencyCode FOREIGN KEY (FromCurrencyCode) REFERENCES Sales.Currency (CurrencyCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Currency.FromCurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'FK_CurrencyRate_Currency_FromCurrencyCode'
GO

ALTER TABLE Sales.CurrencyRate
  ADD CONSTRAINT FK_CurrencyRate_Currency_ToCurrencyCode FOREIGN KEY (ToCurrencyCode) REFERENCES Sales.Currency (CurrencyCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Currency.ToCurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'FK_CurrencyRate_Currency_ToCurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Currency exchange rates.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for CurrencyRate records.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'CurrencyRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the exchange rate was obtained.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'CurrencyRateDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Exchange rate was converted from this currency code.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'FromCurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Exchange rate was converted to this currency code.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'ToCurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Average exchange rate for the day.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'AverageRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Final exchange rate for the day.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'EndOfDayRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'INDEX', N'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'INDEX', N'PK_CurrencyRate_CurrencyRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'PK_CurrencyRate_CurrencyRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'DF_CurrencyRate_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Sales](../Security/Schemas/Sales.md)
- [Sales.Currency](Sales.Currency.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial