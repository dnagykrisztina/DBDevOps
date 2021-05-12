###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.BillOfMaterials


# ![logo](../../../../../Images/table.svg) Production.BillOfMaterials

## <a name="#Description"></a>Description
> Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.
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
|Row Count (~)|2679|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_BillOfMaterials_BillOfMaterialsID](../../../../../Images/primarykey.svg)](#Indexes)|BillOfMaterialsID|int|4|10|0|True|1 - 1|||False|False|Primary key for BillOfMaterials records.|
|[![Foreign Keys FK_BillOfMaterials_Product_ProductAssemblyID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|ProductAssemblyID|int|4|10|0|False||||False|False|Parent product identification number. Foreign key to Product.ProductID.|
|[![Foreign Keys FK_BillOfMaterials_Product_ComponentID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|ComponentID|int|4|10|0|True||||False|False|Component identification number. Foreign key to Product.ProductID.|
|[![Cluster Key AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|StartDate|datetime|8|23|3|True|||(getdate())|False|False|Date the component started being used in the assembly item.|
||EndDate|datetime|8|23|3|False||||False|False|Date the component stopped being used in the assembly item.|
|[![Foreign Keys FK_BillOfMaterials_UnitMeasure_UnitMeasureCode: Production.UnitMeasure](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_BillOfMaterials_UnitMeasureCode](../../../../../Images/index.svg)](#Indexes)|UnitMeasureCode|nchar|3|0|0|True||||False|False|Standard code identifying the unit of measure for the quantity.|
||BOMLevel|smallint|2|5|0|True||||False|False|Indicates the depth the component is from its parent (AssemblyID).|
|[![Check Constraint CK_BillOfMaterials_PerAssemblyQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|PerAssemblyQty|decimal|5|8|2|True|||(1.00)|False|False|Quantity of the component needed to create the assembly.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Cluster Key AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate](../../../../../Images/Cluster.svg)](#Indexes)|AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate|ProductAssemblyID, ComponentID, StartDate|True||Clustered index.|
||IX_BillOfMaterials_UnitMeasureCode|UnitMeasureCode|False||Nonclustered index.|
|[![Primary Key PK_BillOfMaterials_BillOfMaterialsID](../../../../../Images/primarykey.svg)](#Indexes)|PK_BillOfMaterials_BillOfMaterialsID|BillOfMaterialsID|True||Nonclustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_BillOfMaterials_BOMLevel||([ProductAssemblyID] IS NULL AND [BOMLevel]=(0) AND [PerAssemblyQty]=(1.00) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel]>=(1))||
|CK_BillOfMaterials_EndDate||([EndDate]>[StartDate] OR [EndDate] IS NULL)||
|CK_BillOfMaterials_PerAssemblyQty|PerAssemblyQty|([PerAssemblyQty]>=(1.00))||
|CK_BillOfMaterials_ProductAssemblyID||([ProductAssemblyID]<>[ComponentID])||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_BillOfMaterials_Product_ComponentID|ProductID|Foreign key constraint referencing Product.ComponentID.|
|FK_BillOfMaterials_Product_ProductAssemblyID|ProductID|Foreign key constraint referencing Product.ProductAssemblyID.|
|FK_BillOfMaterials_UnitMeasure_UnitMeasureCode|UnitMeasureCode|Foreign key constraint referencing UnitMeasure.UnitMeasureCode.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.BillOfMaterials (
  BillOfMaterialsID int IDENTITY,
  ProductAssemblyID int NULL,
  ComponentID int NOT NULL,
  StartDate datetime NOT NULL CONSTRAINT DF_BillOfMaterials_StartDate DEFAULT (getdate()),
  EndDate datetime NULL,
  UnitMeasureCode nchar(3) NOT NULL,
  BOMLevel smallint NOT NULL,
  PerAssemblyQty decimal(8, 2) NOT NULL CONSTRAINT DF_BillOfMaterials_PerAssemblyQty DEFAULT (1.00),
  ModifiedDate datetime NOT NULL CONSTRAINT DF_BillOfMaterials_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_BillOfMaterials_BillOfMaterialsID PRIMARY KEY NONCLUSTERED (BillOfMaterialsID),
  CONSTRAINT CK_BillOfMaterials_BOMLevel CHECK ([ProductAssemblyID] IS NULL AND [BOMLevel]=(0) AND [PerAssemblyQty]=(1.00) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel]>=(1)),
  CONSTRAINT CK_BillOfMaterials_EndDate CHECK ([EndDate]>[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT CK_BillOfMaterials_PerAssemblyQty CHECK ([PerAssemblyQty]>=(1.00)),
  CONSTRAINT CK_BillOfMaterials_ProductAssemblyID CHECK ([ProductAssemblyID]<>[ComponentID])
)
ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate
  ON Production.BillOfMaterials (ProductAssemblyID, ComponentID, StartDate)
  ON [PRIMARY]
GO

CREATE INDEX IX_BillOfMaterials_UnitMeasureCode
  ON Production.BillOfMaterials (UnitMeasureCode)
  ON [PRIMARY]
GO

ALTER TABLE Production.BillOfMaterials
  ADD CONSTRAINT FK_BillOfMaterials_Product_ComponentID FOREIGN KEY (ComponentID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ComponentID.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'FK_BillOfMaterials_Product_ComponentID'
GO

ALTER TABLE Production.BillOfMaterials
  ADD CONSTRAINT FK_BillOfMaterials_Product_ProductAssemblyID FOREIGN KEY (ProductAssemblyID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductAssemblyID.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'FK_BillOfMaterials_Product_ProductAssemblyID'
GO

ALTER TABLE Production.BillOfMaterials
  ADD CONSTRAINT FK_BillOfMaterials_UnitMeasure_UnitMeasureCode FOREIGN KEY (UnitMeasureCode) REFERENCES Production.UnitMeasure (UnitMeasureCode)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for BillOfMaterials records.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'BillOfMaterialsID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Parent product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'ProductAssemblyID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Component identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'ComponentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the component started being used in the assembly item.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the component stopped being used in the assembly item.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard code identifying the unit of measure for the quantity.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Indicates the depth the component is from its parent (AssemblyID).', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'BOMLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity of the component needed to create the assembly.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'PerAssemblyQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'INDEX', N'AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'INDEX', N'IX_BillOfMaterials_UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'INDEX', N'PK_BillOfMaterials_BillOfMaterialsID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'PK_BillOfMaterials_BillOfMaterialsID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ProductAssemblyID] IS NULL AND [BOMLevel] = (0) AND [PerAssemblyQty] = (1) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel] >= (1)', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'CK_BillOfMaterials_BOMLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint EndDate] > [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'CK_BillOfMaterials_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [PerAssemblyQty] >= (1.00)', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'CK_BillOfMaterials_PerAssemblyQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ProductAssemblyID] <> [ComponentID]', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'CK_BillOfMaterials_ProductAssemblyID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'DF_BillOfMaterials_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1.0', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'DF_BillOfMaterials_PerAssemblyQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'BillOfMaterials', 'CONSTRAINT', N'DF_BillOfMaterials_StartDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)
- [Production.UnitMeasure](Production.UnitMeasure.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [dbo.uspGetBillOfMaterials](../Programmability/Procedures/dbo.uspGetBillOfMaterials.md)
- [dbo.uspGetWhereUsedProductID](../Programmability/Procedures/dbo.uspGetWhereUsedProductID.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial