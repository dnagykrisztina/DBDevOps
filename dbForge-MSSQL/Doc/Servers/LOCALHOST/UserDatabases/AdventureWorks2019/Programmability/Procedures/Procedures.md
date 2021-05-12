###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>Stored Procedures


# ![logo](../../../../../../Images/folder.svg) Stored Procedures



## <a name="#Procedures"></a>Objects _`10`_
|Name|Description
|---|---
|[dbo.uspGetBillOfMaterials](dbo.uspGetBillOfMaterials.md)|Stored procedure using a recursive query to return a multi-level bill of material for the specified ProductID.|
|[dbo.uspGetEmployeeManagers](dbo.uspGetEmployeeManagers.md)|Stored procedure using a recursive query to return the direct and indirect managers of the specified employee.|
|[dbo.uspGetManagerEmployees](dbo.uspGetManagerEmployees.md)|Stored procedure using a recursive query to return the direct and indirect employees of the specified manager.|
|[dbo.uspGetWhereUsedProductID](dbo.uspGetWhereUsedProductID.md)|Stored procedure using a recursive query to return all components or assemblies that directly or indirectly use the specified ProductID.|
|[dbo.uspLogError](dbo.uspLogError.md)|Logs error information in the ErrorLog table about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without inserting error information.|
|[dbo.uspPrintError](dbo.uspPrintError.md)|Prints error information about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without printing any error information.|
|[dbo.uspSearchCandidateResumes](dbo.uspSearchCandidateResumes.md)||
|[HumanResources.uspUpdateEmployeeHireInfo](HumanResources.uspUpdateEmployeeHireInfo.md)|Updates the Employee table and inserts a new row in the EmployeePayHistory table with the values specified in the input parameters.|
|[HumanResources.uspUpdateEmployeeLogin](HumanResources.uspUpdateEmployeeLogin.md)|Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.|
|[HumanResources.uspUpdateEmployeePersonalInfo](HumanResources.uspUpdateEmployeePersonalInfo.md)|Updates the Employee table with the values specified in the input parameters for the given EmployeeID.|

___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial