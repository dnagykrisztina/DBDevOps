###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductCostHistory


# ![logo](../../../../../Images/table.svg) Production.ProductCostHistory

## <a name="#Description"></a>Description
> Changes in the cost of a product over time.
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
|[![Primary Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_ProductCostHistory_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID|
|[![Primary Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|StartDate|datetime|8|23|3|True||||False|False|Product cost start date.|
||EndDate|datetime|8|23|3|False||||False|False|Product cost end date.|
|[![Check Constraint CK_ProductCostHistory_StandardCost](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|StandardCost|money|8|19|4|True||||False|False|Standard cost of the product.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductCostHistory_ProductID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductCostHistory_ProductID_StartDate|ProductID, StartDate|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ProductCostHistory_EndDate||([EndDate]>=[StartDate] OR [EndDate] IS NULL)||
|CK_ProductCostHistory_StandardCost|StandardCost|([StandardCost]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductCostHistory_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductCostHistory (
  ProductID int NOT NULL,
  StartDate datetime NOT NULL,
  EndDate datetime NULL,
  StandardCost money NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductCostHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductCostHistory_ProductID_StartDate PRIMARY KEY CLUSTERED (ProductID, StartDate),
  CONSTRAINT CK_ProductCostHistory_EndDate CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT CK_ProductCostHistory_StandardCost CHECK ([StandardCost]>=(0.00))
)
ON [PRIMARY]
GO

ALTER TABLE Production.ProductCostHistory
  ADD CONSTRAINT FK_ProductCostHistory_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'FK_ProductCostHistory_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Changes in the cost of a product over time.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product cost start date.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product cost end date.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard cost of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'StandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'INDEX', N'PK_ProductCostHistory_ProductID_StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'PK_ProductCostHistory_ProductID_StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'CK_ProductCostHistory_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [StandardCost] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'CK_ProductCostHistory_StandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'DF_ProductCostHistory_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [dbo.ufnGetProductStandardCost](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductStandardCost.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial