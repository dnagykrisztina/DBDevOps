###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SpecialOffer


# ![logo](../../../../../Images/table.svg) Sales.SpecialOffer

## <a name="#Description"></a>Description
> Sale discounts lookup table.
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
|Row Count (~)|16|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SpecialOffer_SpecialOfferID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SpecialOffer_SpecialOfferID](../../../../../Images/Cluster.svg)](#Indexes)|SpecialOfferID|int|4|10|0|True|1 - 1|||False|False|Primary key for SpecialOffer records.|
||Description|nvarchar|255|0|0|True||||False|False|Discount description.|
|[![Check Constraint CK_SpecialOffer_DiscountPct](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|DiscountPct|smallmoney|4|10|4|True|||(0.00)|False|False|Discount precentage.|
||Type|nvarchar|50|0|0|True||||False|False|Discount type category.|
||Category|nvarchar|50|0|0|True||||False|False|Group the discount applies to such as Reseller or Customer.|
||StartDate|datetime|8|23|3|True||||False|False|Discount start date.|
||EndDate|datetime|8|23|3|True||||False|False|Discount end date.|
|[![Check Constraint CK_SpecialOffer_MinQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|MinQty|int|4|10|0|True|||(0)|False|False|Minimum discount percent allowed.|
|[![Check Constraint CK_SpecialOffer_MaxQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|MaxQty|int|4|10|0|False||||False|False|Maximum discount percent allowed.|
|[![Indexes AK_SpecialOffer_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SpecialOffer_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_SpecialOffer_SpecialOfferID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SpecialOffer_SpecialOfferID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SpecialOffer_SpecialOfferID|SpecialOfferID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SpecialOffer_DiscountPct|DiscountPct|([DiscountPct]>=(0.00))||
|CK_SpecialOffer_EndDate||([EndDate]>=[StartDate])||
|CK_SpecialOffer_MaxQty|MaxQty|([MaxQty]>=(0))||
|CK_SpecialOffer_MinQty|MinQty|([MinQty]>=(0))||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SpecialOffer (
  SpecialOfferID int IDENTITY,
  Description nvarchar(255) NOT NULL,
  DiscountPct smallmoney NOT NULL CONSTRAINT DF_SpecialOffer_DiscountPct DEFAULT (0.00),
  Type nvarchar(50) NOT NULL,
  Category nvarchar(50) NOT NULL,
  StartDate datetime NOT NULL,
  EndDate datetime NOT NULL,
  MinQty int NOT NULL CONSTRAINT DF_SpecialOffer_MinQty DEFAULT (0),
  MaxQty int NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SpecialOffer_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SpecialOffer_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SpecialOffer_SpecialOfferID PRIMARY KEY CLUSTERED (SpecialOfferID),
  CONSTRAINT CK_SpecialOffer_DiscountPct CHECK ([DiscountPct]>=(0.00)),
  CONSTRAINT CK_SpecialOffer_EndDate CHECK ([EndDate]>=[StartDate]),
  CONSTRAINT CK_SpecialOffer_MaxQty CHECK ([MaxQty]>=(0)),
  CONSTRAINT CK_SpecialOffer_MinQty CHECK ([MinQty]>=(0))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SpecialOffer_rowguid
  ON Sales.SpecialOffer (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sale discounts lookup table.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for SpecialOffer records.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount description.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'Description'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount precentage.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'DiscountPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount type category.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'Type'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Group the discount applies to such as Reseller or Customer.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'Category'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount start date.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount end date.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Minimum discount percent allowed.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'MinQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Maximum discount percent allowed.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'MaxQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'INDEX', N'AK_SpecialOffer_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'INDEX', N'PK_SpecialOffer_SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'PK_SpecialOffer_SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [DiscountPct] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'CK_SpecialOffer_DiscountPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate]', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'CK_SpecialOffer_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MaxQty] >= (0)', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'CK_SpecialOffer_MaxQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MinQty] >= (0)', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'CK_SpecialOffer_MinQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'DF_SpecialOffer_DiscountPct'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'DF_SpecialOffer_MinQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'DF_SpecialOffer_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOffer', 'CONSTRAINT', N'DF_SpecialOffer_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Sales](../Security/Schemas/Sales.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Sales.SpecialOfferProduct](Sales.SpecialOfferProduct.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial