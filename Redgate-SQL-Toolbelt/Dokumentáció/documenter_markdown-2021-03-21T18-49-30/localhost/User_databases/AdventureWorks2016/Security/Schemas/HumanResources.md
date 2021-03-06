#### 

[Project](../../../../../index.md) > [localhost](../../../../index.md) > [User databases](../../../index.md) > [AdventureWorks2016](../../index.md) > [Security](../index.md) > [Schemas](Schemas.md) > HumanResources

# ![Schemas](../../../../../Images/Schema32.png) HumanResources

---

## <a name="#description"></a>MS_Description

Contains objects related to employees and departments.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../Users/dbo.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE SCHEMA [HumanResources]
AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contains objects related to employees and departments.', 'SCHEMA', N'HumanResources', NULL, NULL, NULL, NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[HumanResources].[Department]](../../Tables/Department.md)
* [[HumanResources].[Employee]](../../Tables/Employee.md)
* [[HumanResources].[EmployeeDepartmentHistory]](../../Tables/EmployeeDepartmentHistory.md)
* [[HumanResources].[EmployeePayHistory]](../../Tables/EmployeePayHistory.md)
* [[HumanResources].[JobCandidate]](../../Tables/JobCandidate.md)
* [[HumanResources].[Shift]](../../Tables/Shift.md)
* [[HumanResources].[vEmployee]](../../Views/vEmployee.md)
* [[HumanResources].[vEmployeeDepartment]](../../Views/vEmployeeDepartment.md)
* [[HumanResources].[vEmployeeDepartmentHistory]](../../Views/vEmployeeDepartmentHistory.md)
* [[HumanResources].[vJobCandidate]](../../Views/vJobCandidate.md)
* [[HumanResources].[vJobCandidateEducation]](../../Views/vJobCandidateEducation.md)
* [[HumanResources].[vJobCandidateEmployment]](../../Views/vJobCandidateEmployment.md)
* [[HumanResources].[uspUpdateEmployeeHireInfo]](../../Programmability/Stored_Procedures/uspUpdateEmployeeHireInfo.md)
* [[HumanResources].[uspUpdateEmployeeLogin]](../../Programmability/Stored_Procedures/uspUpdateEmployeeLogin.md)
* [[HumanResources].[uspUpdateEmployeePersonalInfo]](../../Programmability/Stored_Procedures/uspUpdateEmployeePersonalInfo.md)
* [[HumanResources].[HRResumeSchemaCollection]](../../Programmability/Types/XML_Schema_Collections/HRResumeSchemaCollection.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. m??rcius 21., vas??rnap 18:49:30

