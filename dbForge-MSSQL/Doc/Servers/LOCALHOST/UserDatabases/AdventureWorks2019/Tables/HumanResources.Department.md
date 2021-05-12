###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.Department


# ![logo](../../../../../Images/table.svg) HumanResources.Department

## <a name="#Description"></a>Description
> Lookup table containing the departments within the Adventure Works Cycles company.
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
|[![Primary Key PK_Department_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Department_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)|DepartmentID|smallint|2|5|0|True|1 - 1|||False|False|Primary key for Department records.|
|[![Indexes AK_Department_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the department.|
||GroupName|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the group to which the department belongs.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Department_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_Department_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Department_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Department_DepartmentID|DepartmentID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.Department (
  DepartmentID smallint IDENTITY,
  Name dbo.Name NOT NULL,
  GroupName dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Department_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Department_DepartmentID PRIMARY KEY CLUSTERED (DepartmentID)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Department_Name
  ON HumanResources.Department (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table containing the departments within the Adventure Works Cycles company.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Department records.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'COLUMN', N'DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the department.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the group to which the department belongs.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'COLUMN', N'GroupName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'INDEX', N'AK_Department_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'INDEX', N'PK_Department_DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'CONSTRAINT', N'PK_Department_DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'Department', 'CONSTRAINT', N'DF_Department_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`3`_
- [HumanResources.EmployeeDepartmentHistory](HumanResources.EmployeeDepartmentHistory.md)
- [HumanResources.vEmployeeDepartment](../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../Views/HumanResources.vEmployeeDepartmentHistory.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial