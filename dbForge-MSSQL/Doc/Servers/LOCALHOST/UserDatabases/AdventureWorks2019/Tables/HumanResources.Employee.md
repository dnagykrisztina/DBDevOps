###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.Employee


# ![logo](../../../../../Images/table.svg) HumanResources.Employee

## <a name="#Description"></a>Description
> Employee information such as salary, department, and title.
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
|Row Count (~)|290|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2021. 03. 15. 15:04:28|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Employee_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_Employee_Person_BusinessEntityID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_Employee_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.|
|[![Indexes AK_Employee_NationalIDNumber](../../../../../Images/index.svg)](#Indexes)|NationalIDNumber|nvarchar|15|0|0|True||||False|False|Unique national identification number such as a social security number.|
|[![Indexes AK_Employee_LoginID](../../../../../Images/index.svg)](#Indexes)|LoginID|nvarchar|256|0|0|True||||False|False|Network login.|
||JobTitle|nvarchar|50|0|0|True||||False|False|Work title such as Buyer or Sales Representative.|
|[![Check Constraint CK_Employee_BirthDate](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|BirthDate|date|3|10|0|True||||False|False|Date of birth.|
|[![Check Constraint CK_Employee_MaritalStatus](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|MaritalStatus|nchar|1|0|0|True||||False|False|M = Married, S = Single|
|[![Check Constraint CK_Employee_Gender](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Gender|nchar|1|0|0|True||||False|False|M = Male, F = Female|
|[![Check Constraint CK_Employee_HireDate](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|HireDate|date|3|10|0|True||||False|False|Employee hired on this date.|
||SalariedFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.|
|[![Check Constraint CK_Employee_VacationHours](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|VacationHours|smallint|2|5|0|True|||(0)|False|False|Number of available vacation hours.|
|[![Check Constraint CK_Employee_SickLeaveHours](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SickLeaveHours|smallint|2|5|0|True|||(0)|False|False|Number of available sick leave hours.|
||CurrentFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Inactive, 1 = Active|
|[![Indexes AK_Employee_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Employee_LoginID|LoginID|True||Unique nonclustered index.|
||AK_Employee_NationalIDNumber|NationalIDNumber|True||Unique nonclustered index.|
||AK_Employee_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
|[![Primary Key PK_Employee_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Employee_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Employee_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|dEmployee|True|True|INSTEAD OF DELETE|True|INSTEAD OF DELETE trigger which keeps Employees from being deleted.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Employee_BirthDate|BirthDate|([BirthDate]>='1930-01-01' AND [BirthDate]<=dateadd(year,(-18),getdate()))||
|CK_Employee_Gender|Gender|(upper([Gender])='F' OR upper([Gender])='M')||
|CK_Employee_HireDate|HireDate|([HireDate]>='1996-07-01' AND [HireDate]<=dateadd(day,(1),getdate()))||
|CK_Employee_MaritalStatus|MaritalStatus|(upper([MaritalStatus])='S' OR upper([MaritalStatus])='M')||
|CK_Employee_SickLeaveHours|SickLeaveHours|([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120))||
|CK_Employee_VacationHours|VacationHours|([VacationHours]>=(-40) AND [VacationHours]<=(240))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Employee_Person_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.Employee (
  BusinessEntityID int NOT NULL,
  NationalIDNumber nvarchar(15) NOT NULL,
  LoginID nvarchar(256) NOT NULL,
  JobTitle nvarchar(50) NOT NULL,
  BirthDate date NOT NULL,
  MaritalStatus nchar(1) NOT NULL,
  Gender nchar(1) NOT NULL,
  HireDate date NOT NULL,
  SalariedFlag dbo.Flag NOT NULL CONSTRAINT DF_Employee_SalariedFlag DEFAULT (1),
  VacationHours smallint NOT NULL CONSTRAINT DF_Employee_VacationHours DEFAULT (0),
  SickLeaveHours smallint NOT NULL CONSTRAINT DF_Employee_SickLeaveHours DEFAULT (0),
  CurrentFlag dbo.Flag NOT NULL CONSTRAINT DF_Employee_CurrentFlag DEFAULT (1),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Employee_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Employee_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Employee_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID),
  CONSTRAINT CK_Employee_BirthDate CHECK ([BirthDate]>='1930-01-01' AND [BirthDate]<=dateadd(year,(-18),getdate())),
  CONSTRAINT CK_Employee_Gender CHECK (upper([Gender])='F' OR upper([Gender])='M'),
  CONSTRAINT CK_Employee_HireDate CHECK ([HireDate]>='1996-07-01' AND [HireDate]<=dateadd(day,(1),getdate())),
  CONSTRAINT CK_Employee_MaritalStatus CHECK (upper([MaritalStatus])='S' OR upper([MaritalStatus])='M'),
  CONSTRAINT CK_Employee_SickLeaveHours CHECK ([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120)),
  CONSTRAINT CK_Employee_VacationHours CHECK ([VacationHours]>=(-40) AND [VacationHours]<=(240))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Employee_LoginID
  ON HumanResources.Employee (LoginID)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Employee_NationalIDNumber
  ON HumanResources.Employee (NationalIDNumber)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Employee_rowguid
  ON HumanResources.Employee (rowguid)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER HumanResources.dEmployee ON HumanResources.Employee 
INSTEAD OF DELETE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN
        RAISERROR
            (N'Employees cannot be deleted. They can only be marked as not current.', -- Message
            10, -- Severity.
            1); -- State.

        -- Rollback any active or uncommittable transactions
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END;
END;
GO

ALTER TABLE HumanResources.Employee
  ADD CONSTRAINT FK_Employee_Person_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'FK_Employee_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'INSTEAD OF DELETE trigger which keeps Employees from being deleted.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'TRIGGER', N'dEmployee'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee information such as salary, department, and title.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique national identification number such as a social security number.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'NationalIDNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Network login.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'LoginID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work title such as Buyer or Sales Representative.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'JobTitle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date of birth.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'BirthDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'M = Married, S = Single', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'MaritalStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'M = Male, F = Female', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'Gender'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee hired on this date.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'HireDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'SalariedFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of available vacation hours.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'VacationHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of available sick leave hours.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'SickLeaveHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Inactive, 1 = Active', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'CurrentFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'INDEX', N'AK_Employee_LoginID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'INDEX', N'AK_Employee_NationalIDNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'INDEX', N'AK_Employee_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'INDEX', N'PK_Employee_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'PK_Employee_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [BirthDate] >= ''1930-01-01'' AND [BirthDate] <= dateadd(year,(-18),GETDATE())', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_BirthDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Gender]=''f'' OR [Gender]=''m'' OR [Gender]=''F'' OR [Gender]=''M''', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_Gender'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [HireDate] >= ''1996-07-01'' AND [HireDate] <= dateadd(day,(1),GETDATE())', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_HireDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MaritalStatus]=''s'' OR [MaritalStatus]=''m'' OR [MaritalStatus]=''S'' OR [MaritalStatus]=''M''', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_MaritalStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SickLeaveHours] >= (0) AND [SickLeaveHours] <= (120)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_SickLeaveHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [VacationHours] >= (-40) AND [VacationHours] <= (240)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'CK_Employee_VacationHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_CurrentFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_SalariedFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_SickLeaveHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee', 'CONSTRAINT', N'DF_Employee_VacationHours'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [Person.Person](Person.Person.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)


## <a name="#UsedBy"></a>Used By _`17`_
- [HumanResources.EmployeeDepartmentHistory](HumanResources.EmployeeDepartmentHistory.md)
- [HumanResources.EmployeePayHistory](HumanResources.EmployeePayHistory.md)
- [HumanResources.JobCandidate](HumanResources.JobCandidate.md)
- [Production.Document](Production.Document.md)
- [Purchasing.PurchaseOrderHeader](Purchasing.PurchaseOrderHeader.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [HumanResources.vEmployeeDepartment](../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../Views/HumanResources.vEmployeeDepartmentHistory.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../Views/Sales.vSalesPersonSalesByFiscalYears.md)
- [HumanResources.uspUpdateEmployeeHireInfo](../Programmability/Procedures/HumanResources.uspUpdateEmployeeHireInfo.md)
- [HumanResources.uspUpdateEmployeeLogin](../Programmability/Procedures/HumanResources.uspUpdateEmployeeLogin.md)
- [HumanResources.uspUpdateEmployeePersonalInfo](../Programmability/Procedures/HumanResources.uspUpdateEmployeePersonalInfo.md)
- [dbo.uspGetEmployeeManagers](../Programmability/Procedures/dbo.uspGetEmployeeManagers.md)
- [dbo.uspGetManagerEmployees](../Programmability/Procedures/dbo.uspGetManagerEmployees.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial