###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Security](../Security.md)>[Schemas](Schemas.md)>HumanResources


# ![logo](../../../../../../Images/schema.svg) HumanResources

## <a name="#Description"></a>Description
> Contains objects related to employees and departments.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SCHEMA HumanResources AUTHORIZATION dbo
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to employees and departments.', 'SCHEMA', N'HumanResources'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`16`_
- [HumanResources.Department](../../Tables/HumanResources.Department.md)
- [HumanResources.Employee](../../Tables/HumanResources.Employee.md)
- [HumanResources.EmployeeDepartmentHistory](../../Tables/HumanResources.EmployeeDepartmentHistory.md)
- [HumanResources.EmployeePayHistory](../../Tables/HumanResources.EmployeePayHistory.md)
- [HumanResources.JobCandidate](../../Tables/HumanResources.JobCandidate.md)
- [HumanResources.Shift](../../Tables/HumanResources.Shift.md)
- [HumanResources.vEmployee](../../Views/HumanResources.vEmployee.md)
- [HumanResources.vEmployeeDepartment](../../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../../Views/HumanResources.vEmployeeDepartmentHistory.md)
- [HumanResources.vJobCandidate](../../Views/HumanResources.vJobCandidate.md)
- [HumanResources.vJobCandidateEducation](../../Views/HumanResources.vJobCandidateEducation.md)
- [HumanResources.vJobCandidateEmployment](../../Views/HumanResources.vJobCandidateEmployment.md)
- [HumanResources.uspUpdateEmployeeHireInfo](../../Programmability/Procedures/HumanResources.uspUpdateEmployeeHireInfo.md)
- [HumanResources.uspUpdateEmployeeLogin](../../Programmability/Procedures/HumanResources.uspUpdateEmployeeLogin.md)
- [HumanResources.uspUpdateEmployeePersonalInfo](../../Programmability/Procedures/HumanResources.uspUpdateEmployeePersonalInfo.md)
- [HumanResources.HRResumeSchemaCollection](../../Programmability/Types/XmlSchemaCollection/HumanResources.HRResumeSchemaCollection.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial