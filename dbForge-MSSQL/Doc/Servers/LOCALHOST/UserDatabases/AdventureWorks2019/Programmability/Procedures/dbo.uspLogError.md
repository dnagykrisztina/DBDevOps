###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>dbo.uspLogError


# ![logo](../../../../../../Images/procedure.svg) dbo.uspLogError

## <a name="#Description"></a>Description
> Logs error information in the ErrorLog table about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without inserting error information.
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
|@ErrorLogID|int|4|Output parameter for the stored procedure uspLogError. Contains the ErrorLogID value corresponding to the row inserted by uspLogError in the ErrorLog table.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- uspLogError logs error information in the ErrorLog table about the 
-- error that caused execution to jump to the CATCH block of a 
-- TRY...CATCH construct. This should be executed from within the scope 
-- of a CATCH block otherwise it will return without inserting error 
-- information. 
CREATE OR ALTER PROCEDURE dbo.uspLogError 
    @ErrorLogID [int] = 0 OUTPUT -- contains the ErrorLogID of the row inserted
AS                               -- by uspLogError in the ErrorLog table
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing uspLogError in order to successfully log error information.';
            RETURN;
        END

        INSERT [dbo].[ErrorLog] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SET @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure uspLogError: ';
        EXECUTE [dbo].[uspPrintError];
        RETURN -1;
    END CATCH
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Logs error information in the ErrorLog table about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without inserting error information.', 'SCHEMA', N'dbo', 'PROCEDURE', N'uspLogError'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Output parameter for the stored procedure uspLogError. Contains the ErrorLogID value corresponding to the row inserted by uspLogError in the ErrorLog table.', 'SCHEMA', N'dbo', 'PROCEDURE', N'uspLogError', 'PARAMETER', N'@ErrorLogID'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [dbo.ErrorLog](../../Tables/dbo.ErrorLog.md)
- [dbo.uspPrintError](dbo.uspPrintError.md)


## <a name="#UsedBy"></a>Used By _`9`_
- [Production.WorkOrder](../../Tables/Production.WorkOrder.md)
- [Purchasing.PurchaseOrderDetail](../../Tables/Purchasing.PurchaseOrderDetail.md)
- [Purchasing.PurchaseOrderHeader](../../Tables/Purchasing.PurchaseOrderHeader.md)
- [Purchasing.Vendor](../../Tables/Purchasing.Vendor.md)
- [Sales.SalesOrderDetail](../../Tables/Sales.SalesOrderDetail.md)
- [Sales.SalesOrderHeader](../../Tables/Sales.SalesOrderHeader.md)
- [HumanResources.uspUpdateEmployeeHireInfo](HumanResources.uspUpdateEmployeeHireInfo.md)
- [HumanResources.uspUpdateEmployeeLogin](HumanResources.uspUpdateEmployeeLogin.md)
- [HumanResources.uspUpdateEmployeePersonalInfo](HumanResources.uspUpdateEmployeePersonalInfo.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial