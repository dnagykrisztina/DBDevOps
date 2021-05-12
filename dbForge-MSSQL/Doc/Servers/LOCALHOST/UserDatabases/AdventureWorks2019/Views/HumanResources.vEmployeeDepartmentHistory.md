###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>HumanResources.vEmployeeDepartmentHistory


# ![logo](../../../../../Images/view.svg) HumanResources.vEmployeeDepartmentHistory

## <a name="#Description"></a>Description
> Returns employee name and current and previous departments.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation|SQL_Latin1_General_CP1_CI_AS|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Schema Bound|False|
|Created|2017. 10. 27. 14:33:14|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Description
|---|---|---
||BusinessEntityID||
||Title||
||FirstName||
||MiddleName||
||LastName||
||Suffix||
||Shift||
||Department||
||GroupName||
||StartDate||
||EndDate||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW HumanResources.vEmployeeDepartmentHistory 
AS 
SELECT 
    e.[BusinessEntityID] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,s.[Name] AS [Shift]
    ,d.[Name] AS [Department] 
    ,d.[GroupName] 
    ,edh.[StartDate] 
    ,edh.[EndDate]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 
    INNER JOIN [HumanResources].[Shift] s
    ON s.[ShiftID] = edh.[ShiftID];
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Returns employee name and current and previous departments.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployeeDepartmentHistory'
GO
```

## <a name="#DependsOn"></a>Depends On _`7`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [HumanResources.Shift](../Tables/HumanResources.Shift.md)
- [HumanResources.Department](../Tables/HumanResources.Department.md)
- [HumanResources.Employee](../Tables/HumanResources.Employee.md)
- [Person.Person](../Tables/Person.Person.md)
- [HumanResources.EmployeeDepartmentHistory](../Tables/HumanResources.EmployeeDepartmentHistory.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial