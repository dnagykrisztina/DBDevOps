###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductListPriceHistory


# ![logo](../../../../../Images/table.svg) Production.ProductListPriceHistory

## <a name="#Description"></a>Description
> Changes in the list price of a product over time.
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
|Row Count (~)|395|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductListPriceHistory_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID|
|[![Primary Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|StartDate|datetime|8|23|3|True||||False|False|List price start date.|
||EndDate|datetime|8|23|3|False||||False|False|List price end date|
|[![Check Constraint CK_ProductListPriceHistory_ListPrice](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ListPrice|money|8|19|4|True||||False|False|Product list price.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductListPriceHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductListPriceHistory_ProductID_StartDate|ProductID, StartDate|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ProductListPriceHistory_EndDate||([EndDate]>=[StartDate] OR [EndDate] IS NULL)||
|CK_ProductListPriceHistory_ListPrice|ListPrice|([ListPrice]>(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductListPriceHistory_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductListPriceHistory (
  ProductID int NOT NULL,
  StartDate datetime NOT NULL,
  EndDate datetime NULL,
  ListPrice money NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductListPriceHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductListPriceHistory_ProductID_StartDate PRIMARY KEY CLUSTERED (ProductID, StartDate),
  CONSTRAINT CK_ProductListPriceHistory_EndDate CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT CK_ProductListPriceHistory_ListPrice CHECK ([ListPrice]>(0.00))
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductListPriceHistory
  ADD CONSTRAINT FK_ProductListPriceHistory_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'CONSTRAINT', N'FK_ProductListPriceHistory_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Changes in the list price of a product over time.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'List price start date.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'List price end date', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product list price.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'INDEX', N'PK_ProductListPriceHistory_ProductID_StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'CONSTRAINT', N'PK_ProductListPriceHistory_ProductID_StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'CONSTRAINT', N'CK_ProductListPriceHistory_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ListPrice] > (0.00)', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'CONSTRAINT', N'CK_ProductListPriceHistory_ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'CONSTRAINT', N'DF_ProductListPriceHistory_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [dbo.ufnGetProductDealerPrice](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductDealerPrice.md)
- [dbo.ufnGetProductListPrice](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductListPrice.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial