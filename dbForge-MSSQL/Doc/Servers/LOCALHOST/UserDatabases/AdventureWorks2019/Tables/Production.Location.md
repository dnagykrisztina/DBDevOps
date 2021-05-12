###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.Location


# ![logo](../../../../../Images/table.svg) Production.Location

## <a name="#Description"></a>Description
> Product inventory and manufacturing locations.
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
|Row Count (~)|14|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Location_LocationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Location_LocationID](../../../../../Images/Cluster.svg)](#Indexes)|LocationID|smallint|2|5|0|True|1 - 1|||False|False|Primary key for Location records.|
|[![Indexes AK_Location_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Location description.|
|[![Check Constraint CK_Location_CostRate](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|CostRate|smallmoney|4|10|4|True|||(0.00)|False|False|Standard hourly cost of the manufacturing location.|
|[![Check Constraint CK_Location_Availability](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Availability|decimal|5|8|2|True|||(0.00)|False|False|Work capacity (in hours) of the manufacturing location.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Location_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_Location_LocationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Location_LocationID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Location_LocationID|LocationID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Location_Availability|Availability|([Availability]>=(0.00))||
|CK_Location_CostRate|CostRate|([CostRate]>=(0.00))||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.Location (
  LocationID smallint IDENTITY,
  Name dbo.Name NOT NULL,
  CostRate smallmoney NOT NULL CONSTRAINT DF_Location_CostRate DEFAULT (0.00),
  Availability decimal(8, 2) NOT NULL CONSTRAINT DF_Location_Availability DEFAULT (0.00),
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Location_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Location_LocationID PRIMARY KEY CLUSTERED (LocationID),
  CONSTRAINT CK_Location_Availability CHECK ([Availability]>=(0.00)),
  CONSTRAINT CK_Location_CostRate CHECK ([CostRate]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Location_Name
  ON Production.Location (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product inventory and manufacturing locations.', 'SCHEMA', N'Production', 'TABLE', N'Location'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Location records.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Location description.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard hourly cost of the manufacturing location.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'CostRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work capacity (in hours) of the manufacturing location.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'Availability'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'INDEX', N'AK_Location_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'INDEX', N'PK_Location_LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'PK_Location_LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Availability] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'CK_Location_Availability'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CostRate] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'CK_Location_CostRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.00', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'DF_Location_Availability'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'DF_Location_CostRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Location', 'CONSTRAINT', N'DF_Location_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [Production.ProductInventory](Production.ProductInventory.md)
- [Production.WorkOrderRouting](Production.WorkOrderRouting.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial