#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > HumanResources.vEmployeeDepartmentHistory

# ![Views](../../../../Images/View32.png) [HumanResources].[vEmployeeDepartmentHistory]

---

## <a name="#description"></a>MS_Description

Returns employee name and current and previous departments.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:24:52 2017. október 19., csütörtök |
| Last Modified | 17:29:01 2021. március 21., vasárnap |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| BusinessEntityID | int | 4 |
| Title | nvarchar(8) | 16 |
| FirstName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| MiddleName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| LastName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| Suffix | nvarchar(10) | 20 |
| Shift | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| Department | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| GroupName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| StartDate | date | 3 |
| EndDate | date | 3 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [HumanResources].[vEmployeeDepartmentHistory] 
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
EXEC sp_addextendedproperty N'MS_Description', N'Returns employee name and current and previous departments.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployeeDepartmentHistory', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[Department]](../Tables/Department.md)
* [[HumanResources].[Employee]](../Tables/Employee.md)
* [[HumanResources].[EmployeeDepartmentHistory]](../Tables/EmployeeDepartmentHistory.md)
* [[HumanResources].[Shift]](../Tables/Shift.md)
* [[Person].[Person]](../Tables/Person.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [HumanResources](../Security/Schemas/HumanResources.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

