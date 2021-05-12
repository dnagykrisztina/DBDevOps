###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.EmployeeDepartmentHistory


# ![logo](../../../../../Images/table.svg) HumanResources.EmployeeDepartmentHistory

## <a name="#Description"></a>Description
> Employee department transfers.
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
|Row Count (~)|296|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_EmployeeDepartmentHistory_Employee_BusinessEntityID: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Employee identification number. Foreign key to Employee.BusinessEntityID.|
|[![Primary Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_EmployeeDepartmentHistory_Department_DepartmentID: HumanResources.Department](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_EmployeeDepartmentHistory_DepartmentID](../../../../../Images/index.svg)](#Indexes)|DepartmentID|smallint|2|5|0|True||||False|False|Department in which the employee worked including currently. Foreign key to Department.DepartmentID.|
|[![Primary Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_EmployeeDepartmentHistory_Shift_ShiftID: HumanResources.Shift](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_EmployeeDepartmentHistory_ShiftID](../../../../../Images/index.svg)](#Indexes)|ShiftID|tinyint|1|3|0|True||||False|False|Identifies which 8-hour shift the employee works. Foreign key to Shift.Shift.ID.|
|[![Primary Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)|StartDate|date|3|10|0|True||||False|False|Date the employee started work in the department.|
||EndDate|date|3|10|0|False||||False|False|Date the employee left the department. NULL = Current department.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_EmployeeDepartmentHistory_DepartmentID|DepartmentID|False||Nonclustered index.|
||IX_EmployeeDepartmentHistory_ShiftID|ShiftID|False||Nonclustered index.|
|[![Primary Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID](../../../../../Images/Cluster.svg)](#Indexes)|PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID|BusinessEntityID, StartDate, DepartmentID, ShiftID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_EmployeeDepartmentHistory_EndDate||([EndDate]>=[StartDate] OR [EndDate] IS NULL)||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_EmployeeDepartmentHistory_Department_DepartmentID|DepartmentID|Foreign key constraint referencing Department.DepartmentID.|
|FK_EmployeeDepartmentHistory_Employee_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Employee.EmployeeID.|
|FK_EmployeeDepartmentHistory_Shift_ShiftID|ShiftID|Foreign key constraint referencing Shift.ShiftID|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.EmployeeDepartmentHistory (
  BusinessEntityID int NOT NULL,
  DepartmentID smallint NOT NULL,
  ShiftID tinyint NOT NULL,
  StartDate date NOT NULL,
  EndDate date NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_EmployeeDepartmentHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID PRIMARY KEY CLUSTERED (BusinessEntityID, StartDate, DepartmentID, ShiftID),
  CONSTRAINT CK_EmployeeDepartmentHistory_EndDate CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL)
)
ON [PRIMARY]
GO

CREATE INDEX IX_EmployeeDepartmentHistory_DepartmentID
  ON HumanResources.EmployeeDepartmentHistory (DepartmentID)
  ON [PRIMARY]
GO

CREATE INDEX IX_EmployeeDepartmentHistory_ShiftID
  ON HumanResources.EmployeeDepartmentHistory (ShiftID)
  ON [PRIMARY]
GO

ALTER TABLE HumanResources.EmployeeDepartmentHistory
  ADD CONSTRAINT FK_EmployeeDepartmentHistory_Department_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES HumanResources.Department (DepartmentID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Department.DepartmentID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'FK_EmployeeDepartmentHistory_Department_DepartmentID'
GO

ALTER TABLE HumanResources.EmployeeDepartmentHistory
  ADD CONSTRAINT FK_EmployeeDepartmentHistory_Employee_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'FK_EmployeeDepartmentHistory_Employee_BusinessEntityID'
GO

ALTER TABLE HumanResources.EmployeeDepartmentHistory
  ADD CONSTRAINT FK_EmployeeDepartmentHistory_Shift_ShiftID FOREIGN KEY (ShiftID) REFERENCES HumanResources.Shift (ShiftID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Shift.ShiftID', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'FK_EmployeeDepartmentHistory_Shift_ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee department transfers.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee identification number. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Department in which the employee worked including currently. Foreign key to Department.DepartmentID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Identifies which 8-hour shift the employee works. Foreign key to Shift.Shift.ID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the employee started work in the department.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the employee left the department. NULL = Current department.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'INDEX', N'IX_EmployeeDepartmentHistory_DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'INDEX', N'IX_EmployeeDepartmentHistory_ShiftID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'INDEX', N'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NUL', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'CK_EmployeeDepartmentHistory_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeeDepartmentHistory', 'CONSTRAINT', N'DF_EmployeeDepartmentHistory_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [HumanResources.Department](HumanResources.Department.md)
- [HumanResources.Employee](HumanResources.Employee.md)
- [HumanResources.Shift](HumanResources.Shift.md)


## <a name="#UsedBy"></a>Used By _`2`_
- [HumanResources.vEmployeeDepartment](../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../Views/HumanResources.vEmployeeDepartmentHistory.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial