###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Purchasing.ShipMethod


# ![logo](../../../../../Images/table.svg) Purchasing.ShipMethod

## <a name="#Description"></a>Description
> Shipping company lookup table.
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
|Row Count (~)|5|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ShipMethod_ShipMethodID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ShipMethod_ShipMethodID](../../../../../Images/Cluster.svg)](#Indexes)|ShipMethodID|int|4|10|0|True|1 - 1|||False|False|Primary key for ShipMethod records.|
|[![Indexes AK_ShipMethod_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Shipping company name.|
|[![Check Constraint CK_ShipMethod_ShipBase](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ShipBase|money|8|19|4|True|||(0.00)|False|False|Minimum shipping charge.|
|[![Check Constraint CK_ShipMethod_ShipRate](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ShipRate|money|8|19|4|True|||(0.00)|False|False|Shipping charge per pound.|
|[![Indexes AK_ShipMethod_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_ShipMethod_Name|Name|True||Unique nonclustered index.|
||AK_ShipMethod_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_ShipMethod_ShipMethodID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ShipMethod_ShipMethodID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ShipMethod_ShipMethodID|ShipMethodID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ShipMethod_ShipBase|ShipBase|([ShipBase]>(0.00))||
|CK_ShipMethod_ShipRate|ShipRate|([ShipRate]>(0.00))||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Purchasing.ShipMethod (
  ShipMethodID int IDENTITY,
  Name dbo.Name NOT NULL,
  ShipBase money NOT NULL CONSTRAINT DF_ShipMethod_ShipBase DEFAULT (0.00),
  ShipRate money NOT NULL CONSTRAINT DF_ShipMethod_ShipRate DEFAULT (0.00),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_ShipMethod_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ShipMethod_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ShipMethod_ShipMethodID PRIMARY KEY CLUSTERED (ShipMethodID),
  CONSTRAINT CK_ShipMethod_ShipBase CHECK ([ShipBase]>(0.00)),
  CONSTRAINT CK_ShipMethod_ShipRate CHECK ([ShipRate]>(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ShipMethod_Name
  ON Purchasing.ShipMethod (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_ShipMethod_rowguid
  ON Purchasing.ShipMethod (rowguid)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping company lookup table.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ShipMethod records.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping company name.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Minimum shipping charge.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping charge per pound.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'AK_ShipMethod_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'AK_ShipMethod_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'PK_ShipMethod_ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'PK_ShipMethod_ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipBase] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'CK_ShipMethod_ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipRate] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'CK_ShipMethod_ShipRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ShipRate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Purchasing](../Security/Schemas/Purchasing.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [Purchasing.PurchaseOrderHeader](Purchasing.PurchaseOrderHeader.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial