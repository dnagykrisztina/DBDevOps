###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>HumanResources.uspUpdateEmployeePersonalInfo


# ![logo](../../../../../../Images/procedure.svg) HumanResources.uspUpdateEmployeePersonalInfo

## <a name="#Description"></a>Description
> Updates the Employee table with the values specified in the input parameters for the given EmployeeID.
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
|@BusinessEntityID|int|4|Input parameter for the stored procedure uspUpdateEmployeePersonalInfo. Enter a valid BusinessEntityID from the HumanResources.Employee table.|
|@NationalIDNumber|nvarchar|15|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a national ID for the employee.|
|@BirthDate|datetime|8|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a birth date for the employee.|
|@MaritalStatus|nchar|1|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a marital status for the employee.|
|@Gender|nchar|1|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a gender for the employee.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER PROCEDURE HumanResources.uspUpdateEmployeePersonalInfo
    @BusinessEntityID [int], 
    @NationalIDNumber [nvarchar](15), 
    @BirthDate [datetime], 
    @MaritalStatus [nchar](1), 
    @Gender [nchar](1)
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [NationalIDNumber] = @NationalIDNumber 
            ,[BirthDate] = @BirthDate 
            ,[MaritalStatus] = @MaritalStatus 
            ,[Gender] = @Gender 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Updates the Employee table with the values specified in the input parameters for the given EmployeeID.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeePersonalInfo. Enter a valid BusinessEntityID from the HumanResources.Employee table.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a national ID for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@NationalIDNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a birth date for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@BirthDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a marital status for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@MaritalStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a gender for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@Gender'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [HumanResources](../../Security/Schemas/HumanResources.md)
- [HumanResources.Employee](../../Tables/HumanResources.Employee.md)
- [dbo.uspLogError](dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial