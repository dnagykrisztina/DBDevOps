###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>HumanResources.uspUpdateEmployeeHireInfo


# ![logo](../../../../../../Images/procedure.svg) HumanResources.uspUpdateEmployeeHireInfo

## <a name="#Description"></a>Description
> Updates the Employee table and inserts a new row in the EmployeePayHistory table with the values specified in the input parameters.
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
|@BusinessEntityID|int|4|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid BusinessEntityID from the Employee table.|
|@JobTitle|nvarchar|50|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.|
|@HireDate|datetime|8|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.|
|@RateChangeDate|datetime|8|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the date the rate changed for the employee.|
|@Rate|money|8|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the new rate for the employee.|
|@PayFrequency|tinyint|1|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the pay frequency for the employee.|
|@CurrentFlag|Flag|1|Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER PROCEDURE HumanResources.uspUpdateEmployeeHireInfo
    @BusinessEntityID [int], 
    @JobTitle [nvarchar](50), 
    @HireDate [datetime], 
    @RateChangeDate [datetime], 
    @Rate [money], 
    @PayFrequency [tinyint], 
    @CurrentFlag [dbo].[Flag] 
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [HumanResources].[Employee] 
        SET [JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;

        INSERT INTO [HumanResources].[EmployeePayHistory] 
            ([BusinessEntityID]
            ,[RateChangeDate]
            ,[Rate]
            ,[PayFrequency]) 
        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Updates the Employee table and inserts a new row in the EmployeePayHistory table with the values specified in the input parameters.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid BusinessEntityID from the Employee table.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@JobTitle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@HireDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the date the rate changed for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@RateChangeDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the new rate for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@Rate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the pay frequency for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@PayFrequency'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeeHireInfo', 'PARAMETER', N'@CurrentFlag'
GO
```

## <a name="#DependsOn"></a>Depends On _`5`_
- [HumanResources](../../Security/Schemas/HumanResources.md)
- [dbo.Flag](../Types/UserDefinedDataTypes/dbo.Flag.md)
- [HumanResources.Employee](../../Tables/HumanResources.Employee.md)
- [HumanResources.EmployeePayHistory](../../Tables/HumanResources.EmployeePayHistory.md)
- [dbo.uspLogError](dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial