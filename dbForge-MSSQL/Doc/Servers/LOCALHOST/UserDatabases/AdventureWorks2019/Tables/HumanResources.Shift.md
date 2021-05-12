###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.Shift


# ![logo](../../../../../Images/table.svg) HumanResources.Shift

## <a name="#Description"></a>Description
> Work shift lookup table.
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
|Row Count (~)|3|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Shift_ShiftID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Shift_ShiftID](../../../../../Images/Cluster.svg)](#Indexes)|ShiftID|tinyint|1|3|0|True|1 - 1|||False|False|Primary key for Shift records.|
|[![Indexes AK_Shift_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Shift description.|
|[![Indexes AK_Shift_StartTime_EndTime](../../../../../Images/index.svg)](#Indexes)|StartTime|time|5|16|7|True||||False|False|Shift start time.|
|[![Indexes AK_Shift_StartTime_EndTime](../../../../../Images/index.svg)](#Indexes)|EndTime|time|5|16|7|True||||False|False|Shift end time.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Shift_Name|Name|True||Unique nonclustered index.|
||AK_Shift_StartTime_EndTime|StartTime, EndTime|True||Unique nonclustered index.|
|[![Primary Key PK_Shift_ShiftID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Shift_ShiftID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Shift_ShiftID|ShiftID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.Shift (
  ShiftID tinyint IDENTITY,
  Name dbo.Name NOT NULL,
  StartTime time NOT NULL,
  EndTime time NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Shift_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Shift_ShiftID PRIMARY KEY CLUSTERED (ShiftID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Shift_Name
  ON HumanResources.Shift (Name)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Shift_StartTime_EndTime
  ON HumanResources.Shift (StartTime, EndTime)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work shift lookup table.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Shift records.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'COLUMN', N'ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shift description.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shift start time.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'COLUMN', N'StartTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shift end time.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'COLUMN', N'EndTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'INDEX', N'AK_Shift_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'INDEX', N'AK_Shift_StartTime_EndTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'INDEX', N'PK_Shift_ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'CONSTRAINT', N'PK_Shift_ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'Shift', 'CONSTRAINT', N'DF_Shift_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [HumanResources.EmployeeDepartmentHistory](HumanResources.EmployeeDepartmentHistory.md)
- [HumanResources.vEmployeeDepartmentHistory](../Views/HumanResources.vEmployeeDepartmentHistory.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial