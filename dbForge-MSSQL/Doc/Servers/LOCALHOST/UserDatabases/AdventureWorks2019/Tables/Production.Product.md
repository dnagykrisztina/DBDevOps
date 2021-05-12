###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.Product


# ![logo](../../../../../Images/table.svg) Production.Product

## <a name="#Description"></a>Description
> Products sold or used in the manfacturing of sold products.
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
|Row Count (~)|504|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Product_ProductID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Product_ProductID](../../../../../Images/Cluster.svg)](#Indexes)|ProductID|int|4|10|0|True|1 - 1|||False|False|Primary key for Product records.|
|[![Indexes AK_Product_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the product.|
|[![Indexes AK_Product_ProductNumber](../../../../../Images/index.svg)](#Indexes)|ProductNumber|nvarchar|25|0|0|True||||False|False|Unique product identification number.|
||MakeFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Product is purchased, 1 = Product is manufactured in-house.|
||FinishedGoodsFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Product is not a salable item. 1 = Product is salable.|
||Color|nvarchar|15|0|0|False||||False|False|Product color.|
|[![Check Constraint CK_Product_SafetyStockLevel](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SafetyStockLevel|smallint|2|5|0|True||||False|False|Minimum inventory quantity. |
|[![Check Constraint CK_Product_ReorderPoint](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ReorderPoint|smallint|2|5|0|True||||False|False|Inventory level that triggers a purchase order or work order. |
|[![Check Constraint CK_Product_StandardCost](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|StandardCost|money|8|19|4|True||||False|False|Standard cost of the product.|
|[![Check Constraint CK_Product_ListPrice](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ListPrice|money|8|19|4|True||||False|False|Selling price.|
||Size|nvarchar|5|0|0|False||||False|False|Product size.|
|[![Foreign Keys FK_Product_UnitMeasure_SizeUnitMeasureCode: Production.UnitMeasure](../../../../../Images/foreignkey.svg)](#ForeignKeys)|SizeUnitMeasureCode|nchar|3|0|0|False||||False|False|Unit of measure for Size column.|
|[![Foreign Keys FK_Product_UnitMeasure_WeightUnitMeasureCode: Production.UnitMeasure](../../../../../Images/foreignkey.svg)](#ForeignKeys)|WeightUnitMeasureCode|nchar|3|0|0|False||||False|False|Unit of measure for Weight column.|
|[![Check Constraint CK_Product_Weight](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Weight|decimal|5|8|2|False||||False|False|Product weight.|
|[![Check Constraint CK_Product_DaysToManufacture](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|DaysToManufacture|int|4|10|0|True||||False|False|Number of days required to manufacture the product.|
|[![Check Constraint CK_Product_ProductLine](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ProductLine|nchar|2|0|0|False||||False|False|R = Road, M = Mountain, T = Touring, S = Standard|
|[![Check Constraint CK_Product_Class](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Class|nchar|2|0|0|False||||False|False|H = High, M = Medium, L = Low|
|[![Check Constraint CK_Product_Style](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Style|nchar|2|0|0|False||||False|False|W = Womens, M = Mens, U = Universal|
|[![Foreign Keys FK_Product_ProductSubcategory_ProductSubcategoryID: Production.ProductSubcategory](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ProductSubcategoryID|int|4|10|0|False||||False|False|Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. |
|[![Foreign Keys FK_Product_ProductModel_ProductModelID: Production.ProductModel](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ProductModelID|int|4|10|0|False||||False|False|Product is a member of this product model. Foreign key to ProductModel.ProductModelID.|
||SellStartDate|datetime|8|23|3|True||||False|False|Date the product was available for sale.|
||SellEndDate|datetime|8|23|3|False||||False|False|Date the product was no longer available for sale.|
||DiscontinuedDate|datetime|8|23|3|False||||False|False|Date the product was discontinued.|
|[![Indexes AK_Product_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Product_Name|Name|True||Unique nonclustered index.|
||AK_Product_ProductNumber|ProductNumber|True||Unique nonclustered index.|
||AK_Product_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_Product_ProductID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Product_ProductID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Product_ProductID|ProductID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Product_Class|Class|(upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL)||
|CK_Product_DaysToManufacture|DaysToManufacture|([DaysToManufacture]>=(0))||
|CK_Product_ListPrice|ListPrice|([ListPrice]>=(0.00))||
|CK_Product_ProductLine|ProductLine|(upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL)||
|CK_Product_ReorderPoint|ReorderPoint|([ReorderPoint]>(0))||
|CK_Product_SafetyStockLevel|SafetyStockLevel|([SafetyStockLevel]>(0))||
|CK_Product_SellEndDate||([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL)||
|CK_Product_StandardCost|StandardCost|([StandardCost]>=(0.00))||
|CK_Product_Style|Style|(upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL)||
|CK_Product_Weight|Weight|([Weight]>(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Product_ProductModel_ProductModelID|ProductModelID|Foreign key constraint referencing ProductModel.ProductModelID.|
|FK_Product_ProductSubcategory_ProductSubcategoryID|ProductSubcategoryID|Foreign key constraint referencing ProductSubcategory.ProductSubcategoryID.|
|FK_Product_UnitMeasure_SizeUnitMeasureCode|UnitMeasureCode|Foreign key constraint referencing UnitMeasure.UnitMeasureCode.|
|FK_Product_UnitMeasure_WeightUnitMeasureCode|UnitMeasureCode|Foreign key constraint referencing UnitMeasure.UnitMeasureCode.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.Product (
  ProductID int IDENTITY,
  Name dbo.Name NOT NULL,
  ProductNumber nvarchar(25) NOT NULL,
  MakeFlag dbo.Flag NOT NULL CONSTRAINT DF_Product_MakeFlag DEFAULT (1),
  FinishedGoodsFlag dbo.Flag NOT NULL CONSTRAINT DF_Product_FinishedGoodsFlag DEFAULT (1),
  Color nvarchar(15) NULL,
  SafetyStockLevel smallint NOT NULL,
  ReorderPoint smallint NOT NULL,
  StandardCost money NOT NULL,
  ListPrice money NOT NULL,
  Size nvarchar(5) NULL,
  SizeUnitMeasureCode nchar(3) NULL,
  WeightUnitMeasureCode nchar(3) NULL,
  Weight decimal(8, 2) NULL,
  DaysToManufacture int NOT NULL,
  ProductLine nchar(2) NULL,
  Class nchar(2) NULL,
  Style nchar(2) NULL,
  ProductSubcategoryID int NULL,
  ProductModelID int NULL,
  SellStartDate datetime NOT NULL,
  SellEndDate datetime NULL,
  DiscontinuedDate datetime NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Product_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Product_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Product_ProductID PRIMARY KEY CLUSTERED (ProductID),
  CONSTRAINT CK_Product_Class CHECK (upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL),
  CONSTRAINT CK_Product_DaysToManufacture CHECK ([DaysToManufacture]>=(0)),
  CONSTRAINT CK_Product_ListPrice CHECK ([ListPrice]>=(0.00)),
  CONSTRAINT CK_Product_ProductLine CHECK (upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL),
  CONSTRAINT CK_Product_ReorderPoint CHECK ([ReorderPoint]>(0)),
  CONSTRAINT CK_Product_SafetyStockLevel CHECK ([SafetyStockLevel]>(0)),
  CONSTRAINT CK_Product_SellEndDate CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL),
  CONSTRAINT CK_Product_StandardCost CHECK ([StandardCost]>=(0.00)),
  CONSTRAINT CK_Product_Style CHECK (upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL),
  CONSTRAINT CK_Product_Weight CHECK ([Weight]>(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Product_Name
  ON Production.Product (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Product_ProductNumber
  ON Production.Product (ProductNumber)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Product_rowguid
  ON Production.Product (rowguid)
  ON [PRIMARY]
GO

ALTER TABLE Production.Product
  ADD CONSTRAINT FK_Product_ProductModel_ProductModelID FOREIGN KEY (ProductModelID) REFERENCES Production.ProductModel (ProductModelID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'FK_Product_ProductModel_ProductModelID'
GO

ALTER TABLE Production.Product
  ADD CONSTRAINT FK_Product_ProductSubcategory_ProductSubcategoryID FOREIGN KEY (ProductSubcategoryID) REFERENCES Production.ProductSubcategory (ProductSubcategoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductSubcategory.ProductSubcategoryID.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'FK_Product_ProductSubcategory_ProductSubcategoryID'
GO

ALTER TABLE Production.Product
  ADD CONSTRAINT FK_Product_UnitMeasure_SizeUnitMeasureCode FOREIGN KEY (SizeUnitMeasureCode) REFERENCES Production.UnitMeasure (UnitMeasureCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'FK_Product_UnitMeasure_SizeUnitMeasureCode'
GO

ALTER TABLE Production.Product
  ADD CONSTRAINT FK_Product_UnitMeasure_WeightUnitMeasureCode FOREIGN KEY (WeightUnitMeasureCode) REFERENCES Production.UnitMeasure (UnitMeasureCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'FK_Product_UnitMeasure_WeightUnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Products sold or used in the manfacturing of sold products.', 'SCHEMA', N'Production', 'TABLE', N'Product'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Product records.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the product.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique product identification number.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ProductNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Product is purchased, 1 = Product is manufactured in-house.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'MakeFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Product is not a salable item. 1 = Product is salable.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'FinishedGoodsFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product color.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Color'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Minimum inventory quantity. ', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'SafetyStockLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Inventory level that triggers a purchase order or work order. ', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ReorderPoint'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard cost of the product.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'StandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Selling price.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product size.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Size'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure for Size column.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'SizeUnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure for Weight column.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'WeightUnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product weight.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Weight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of days required to manufacture the product.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'DaysToManufacture'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'R = Road, M = Mountain, T = Touring, S = Standard', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ProductLine'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'H = High, M = Medium, L = Low', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Class'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'W = Womens, M = Mens, U = Universal', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'Style'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. ', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ProductSubcategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product is a member of this product model. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was available for sale.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'SellStartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was no longer available for sale.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'SellEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was discontinued.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'DiscontinuedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'INDEX', N'AK_Product_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'INDEX', N'AK_Product_ProductNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'INDEX', N'AK_Product_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Product', 'INDEX', N'PK_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'PK_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Class]=''h'' OR [Class]=''m'' OR [Class]=''l'' OR [Class]=''H'' OR [Class]=''M'' OR [Class]=''L'' OR [Class] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_Class'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [DaysToManufacture] >= (0)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_DaysToManufacture'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ListPrice] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ProductLine]=''r'' OR [ProductLine]=''m'' OR [ProductLine]=''t'' OR [ProductLine]=''s'' OR [ProductLine]=''R'' OR [ProductLine]=''M'' OR [ProductLine]=''T'' OR [ProductLine]=''S'' OR [ProductLine] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_ProductLine'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ReorderPoint] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_ReorderPoint'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_SafetyStockLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SellEndDate] >= [SellStartDate] OR [SellEndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_SellEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_StandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Style]=''u'' OR [Style]=''m'' OR [Style]=''w'' OR [Style]=''U'' OR [Style]=''M'' OR [Style]=''W'' OR [Style] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_Style'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Weight] > (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'CK_Product_Weight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of  1', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'DF_Product_FinishedGoodsFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of  1', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'DF_Product_MakeFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'DF_Product_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'Product', 'CONSTRAINT', N'DF_Product_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`6`_
- [Production](../Security/Schemas/Production.md)
- [Production.ProductModel](Production.ProductModel.md)
- [Production.ProductSubcategory](Production.ProductSubcategory.md)
- [Production.UnitMeasure](Production.UnitMeasure.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)


## <a name="#UsedBy"></a>Used By _`19`_
- [Production.BillOfMaterials](Production.BillOfMaterials.md)
- [Production.ProductCostHistory](Production.ProductCostHistory.md)
- [Production.ProductDocument](Production.ProductDocument.md)
- [Production.ProductInventory](Production.ProductInventory.md)
- [Production.ProductListPriceHistory](Production.ProductListPriceHistory.md)
- [Production.ProductProductPhoto](Production.ProductProductPhoto.md)
- [Production.ProductReview](Production.ProductReview.md)
- [Production.TransactionHistory](Production.TransactionHistory.md)
- [Production.WorkOrder](Production.WorkOrder.md)
- [Purchasing.ProductVendor](Purchasing.ProductVendor.md)
- [Purchasing.PurchaseOrderDetail](Purchasing.PurchaseOrderDetail.md)
- [Sales.ShoppingCartItem](Sales.ShoppingCartItem.md)
- [Sales.SpecialOfferProduct](Sales.SpecialOfferProduct.md)
- [Production.vProductAndDescription](../Views/Production.vProductAndDescription.md)
- [dbo.uspGetBillOfMaterials](../Programmability/Procedures/dbo.uspGetBillOfMaterials.md)
- [dbo.uspGetWhereUsedProductID](../Programmability/Procedures/dbo.uspGetWhereUsedProductID.md)
- [dbo.ufnGetProductDealerPrice](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductDealerPrice.md)
- [dbo.ufnGetProductListPrice](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductListPrice.md)
- [dbo.ufnGetProductStandardCost](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetProductStandardCost.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial