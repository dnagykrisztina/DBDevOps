###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.UnitMeasure


# ![logo](../../../../../Images/table.svg) Production.UnitMeasure

## <a name="#Description"></a>Description
> Unit of measure lookup table.
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
|Row Count (~)|38|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_UnitMeasure_UnitMeasureCode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_UnitMeasure_UnitMeasureCode](../../../../../Images/Cluster.svg)](#Indexes)|UnitMeasureCode|nchar|3|0|0|True||||False|False|Primary key.|
|[![Indexes AK_UnitMeasure_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Unit of measure description.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_UnitMeasure_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_UnitMeasure_UnitMeasureCode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_UnitMeasure_UnitMeasureCode](../../../../../Images/Cluster.svg)](#Indexes)|PK_UnitMeasure_UnitMeasureCode|UnitMeasureCode|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.UnitMeasure (
  UnitMeasureCode nchar(3) NOT NULL,
  Name dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_UnitMeasure_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_UnitMeasure_UnitMeasureCode PRIMARY KEY CLUSTERED (UnitMeasureCode)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_UnitMeasure_Name
  ON Production.UnitMeasure (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure lookup table.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'COLUMN', N'UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure description.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'INDEX', N'AK_UnitMeasure_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'INDEX', N'PK_UnitMeasure_UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'CONSTRAINT', N'PK_UnitMeasure_UnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'UnitMeasure', 'CONSTRAINT', N'DF_UnitMeasure_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`3`_
- [Production.BillOfMaterials](Production.BillOfMaterials.md)
- [Production.Product](Production.Product.md)
- [Purchasing.ProductVendor](Purchasing.ProductVendor.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial