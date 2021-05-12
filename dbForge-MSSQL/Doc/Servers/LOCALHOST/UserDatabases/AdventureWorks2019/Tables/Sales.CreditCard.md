###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.CreditCard


# ![logo](../../../../../Images/table.svg) Sales.CreditCard

## <a name="#Description"></a>Description
> Customer credit card information.
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
|Row Count (~)|19118|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_CreditCard_CreditCardID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CreditCard_CreditCardID](../../../../../Images/Cluster.svg)](#Indexes)|CreditCardID|int|4|10|0|True|1 - 1|||False|False|Primary key for CreditCard records.|
||CardType|nvarchar|50|0|0|True||||False|False|Credit card name.|
|[![Indexes AK_CreditCard_CardNumber](../../../../../Images/index.svg)](#Indexes)|CardNumber|nvarchar|25|0|0|True||||False|False|Credit card number.|
||ExpMonth|tinyint|1|3|0|True||||False|False|Credit card expiration month.|
||ExpYear|smallint|2|5|0|True||||False|False|Credit card expiration year.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_CreditCard_CardNumber|CardNumber|True||Unique nonclustered index.|
|[![Primary Key PK_CreditCard_CreditCardID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CreditCard_CreditCardID](../../../../../Images/Cluster.svg)](#Indexes)|PK_CreditCard_CreditCardID|CreditCardID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.CreditCard (
  CreditCardID int IDENTITY,
  CardType nvarchar(50) NOT NULL,
  CardNumber nvarchar(25) NOT NULL,
  ExpMonth tinyint NOT NULL,
  ExpYear smallint NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_CreditCard_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_CreditCard_CreditCardID PRIMARY KEY CLUSTERED (CreditCardID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_CreditCard_CardNumber
  ON Sales.CreditCard (CardNumber)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer credit card information.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for CreditCard records.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card name.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CardType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card number.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CardNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card expiration month.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ExpMonth'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card expiration year.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ExpYear'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'INDEX', N'AK_CreditCard_CardNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'INDEX', N'PK_CreditCard_CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'CONSTRAINT', N'PK_CreditCard_CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'CONSTRAINT', N'DF_CreditCard_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Sales](../Security/Schemas/Sales.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [Sales.PersonCreditCard](Sales.PersonCreditCard.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial