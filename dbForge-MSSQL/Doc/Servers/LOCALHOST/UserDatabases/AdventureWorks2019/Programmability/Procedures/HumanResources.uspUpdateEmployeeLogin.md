###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>HumanResources.uspUpdateEmployeeLogin


# ![logo](../../../../../../Images/procedure.svg) HumanResources.uspUpdateEmployeeLogin

## <a name="#Description"></a>Description
> Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Assembly||


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Description
|---|---|---|---
|@BusinessEntityID|int|4|Input parameter for the stored procedure uspUpdateEmployeeLogin. Enter a valid EmployeeID from the Employee table.|
|@OrganizationNode|hierarchyid|892|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid ManagerID for the employee.|
|@LoginID|nvarchar|256|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid login for the employee.|
|@JobTitle|nvarchar|50|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.|
|@HireDate|datetime|8|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.|
|@CurrentFlag|Flag|1|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER PROCEDURE HumanResources.uspUpdateEmployeeLogin
    @BusinessEntityID [int], 
    @OrganizationNode [hierarchyid],
    @LoginID [nvarchar](256),
    @JobTitle [nvarchar](50),
    @HireDate [datetime],
    @CurrentFlag [dbo].[Flag]
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeLogin. Enter a valid EmployeeID from the Employee table.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid ManagerID for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@OrganizationNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid login for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@LoginID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@JobTitle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@HireDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeLogin', 'PARAMETER', N'@CurrentFlag'
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [HumanResources](../../Security/Schemas/HumanResources.md)
- [dbo.Flag](../Types/UserDefinedDataTypes/dbo.Flag.md)
- [HumanResources.Employee](../../Tables/HumanResources.Employee.md)
- [dbo.uspLogError](dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial