###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>dbo.uspPrintError


# ![logo](../../../../../../Images/procedure.svg) dbo.uspPrintError

## <a name="#Description"></a>Description
> Prints error information about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without printing any error information.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Assembly||


## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- uspPrintError prints error information about the error that caused 
-- execution to jump to the CATCH block of a TRY...CATCH construct. 
-- Should be executed from within the scope of a CATCH block otherwise 
-- it will return without printing any error information.
CREATE OR ALTER PROCEDURE dbo.uspPrintError 
AS
BEGIN
    SET NOCOUNT ON;

    -- Print error information. 
    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Prints error information about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without printing any error information.', 'SCHEMA', N'dbo', 'PROCEDURE', N'uspPrintError'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`7`_
- [Production.WorkOrder](../../Tables/Production.WorkOrder.md)
- [Purchasing.PurchaseOrderDetail](../../Tables/Purchasing.PurchaseOrderDetail.md)
- [Purchasing.PurchaseOrderHeader](../../Tables/Purchasing.PurchaseOrderHeader.md)
- [Purchasing.Vendor](../../Tables/Purchasing.Vendor.md)
- [Sales.SalesOrderDetail](../../Tables/Sales.SalesOrderDetail.md)
- [Sales.SalesOrderHeader](../../Tables/Sales.SalesOrderHeader.md)
- [dbo.uspLogError](dbo.uspLogError.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial