###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Functions](../Functions.md)>[Scalar-Valued Functions](ScalarValuedFunctions.md)>dbo.ufnGetDocumentStatusText


# ![logo](../../../../../../../Images/scalarfunction.svg) dbo.ufnGetDocumentStatusText

## <a name="#Description"></a>Description
> Scalar function returning the text representation of the Status column in the Document table.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Null on Null Input|False|
|Schema Bound|False|
|Assembly||


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Description
|---|---|---|---
|(Result)|nvarchar|16||
|@Status|tinyint|1|Input parameter for the scalar function ufnGetDocumentStatusText. Enter a valid integer.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER FUNCTION dbo.ufnGetDocumentStatusText(@Status [tinyint])
RETURNS [nvarchar](16) 
AS 
-- Returns the sales order status text representation for the status value.
BEGIN
    DECLARE @ret [nvarchar](16);

    SET @ret = 
        CASE @Status
            WHEN 1 THEN N'Pending approval'
            WHEN 2 THEN N'Approved'
            WHEN 3 THEN N'Obsolete'
            ELSE N'** Invalid **'
        END;
    
    RETURN @ret
END;
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Scalar function returning the text representation of the Status column in the Document table.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetDocumentStatusText'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the scalar function ufnGetDocumentStatusText. Enter a valid integer.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetDocumentStatusText', 'PARAMETER', N'@Status'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial