###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.EmployeePayHistory


# ![logo](../../../../../Images/table.svg) HumanResources.EmployeePayHistory

## <a name="#Description"></a>Description
> Employee pay history.
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
|Row Count (~)|316|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_EmployeePayHistory_Employee_BusinessEntityID: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Employee identification number. Foreign key to Employee.BusinessEntityID.|
|[![Primary Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/Cluster.svg)](#Indexes)|RateChangeDate|datetime|8|23|3|True||||False|False|Date the change in pay is effective|
|[![Check Constraint CK_EmployeePayHistory_Rate](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Rate|money|8|19|4|True||||False|False|Salary hourly rate.|
|[![Check Constraint CK_EmployeePayHistory_PayFrequency](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|PayFrequency|tinyint|1|3|0|True||||False|False|1 = Salary received monthly, 2 = Salary received biweekly|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_EmployeePayHistory_BusinessEntityID_RateChangeDate](../../../../../Images/Cluster.svg)](#Indexes)|PK_EmployeePayHistory_BusinessEntityID_RateChangeDate|BusinessEntityID, RateChangeDate|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_EmployeePayHistory_PayFrequency|PayFrequency|([PayFrequency]=(2) OR [PayFrequency]=(1))||
|CK_EmployeePayHistory_Rate|Rate|([Rate]>=(6.50) AND [Rate]<=(200.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_EmployeePayHistory_Employee_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Employee.EmployeeID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.EmployeePayHistory (
  BusinessEntityID int NOT NULL,
  RateChangeDate datetime NOT NULL,
  Rate money NOT NULL,
  PayFrequency tinyint NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_EmployeePayHistory_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_EmployeePayHistory_BusinessEntityID_RateChangeDate PRIMARY KEY CLUSTERED (BusinessEntityID, RateChangeDate),
  CONSTRAINT CK_EmployeePayHistory_PayFrequency CHECK ([PayFrequency]=(2) OR [PayFrequency]=(1)),
  CONSTRAINT CK_EmployeePayHistory_Rate CHECK ([Rate]>=(6.50) AND [Rate]<=(200.00))
)
ON [PRIMARY]
GO

ALTER TABLE HumanResources.EmployeePayHistory
  ADD CONSTRAINT FK_EmployeePayHistory_Employee_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'CONSTRAINT', N'FK_EmployeePayHistory_Employee_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee pay history.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee identification number. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the change in pay is effective', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'COLUMN', N'RateChangeDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Salary hourly rate.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'COLUMN', N'Rate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1 = Salary received monthly, 2 = Salary received biweekly', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'COLUMN', N'PayFrequency'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'INDEX', N'PK_EmployeePayHistory_BusinessEntityID_RateChangeDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'CONSTRAINT', N'PK_EmployeePayHistory_BusinessEntityID_RateChangeDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [PayFrequency]=(3) OR [PayFrequency]=(2) OR [PayFrequency]=(1)', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'CONSTRAINT', N'CK_EmployeePayHistory_PayFrequency'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Rate] >= (6.50) AND [Rate] <= (200.00)', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'CONSTRAINT', N'CK_EmployeePayHistory_Rate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'EmployeePayHistory', 'CONSTRAINT', N'DF_EmployeePayHistory_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [HumanResources.Employee](HumanResources.Employee.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [HumanResources.uspUpdateEmployeeHireInfo](../Programmability/Procedures/HumanResources.uspUpdateEmployeeHireInfo.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial