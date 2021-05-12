###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>dbo.ErrorLog


# ![logo](../../../../../Images/table.svg) dbo.ErrorLog

## <a name="#Description"></a>Description
> Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation||
|File Group||
|Filestream File Group||
|Is Partitioned|False|
|Partitioned Column||
|Partition Scheme||
|File Groups||
|Filestream Partition Scheme||
|Filestream File Groups||
|Heap|False|
|Full Text Catalog||
|Full Text||
|Compression|NONE|
|Row Count (~)|0|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:01|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ErrorLog_ErrorLogID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ErrorLog_ErrorLogID](../../../../../Images/Cluster.svg)](#Indexes)|ErrorLogID|int|4|10|0|True|1 - 1|||False|False|Primary key for ErrorLog records.|
||ErrorTime|datetime|8|23|3|True|||(getdate())|False|False|The date and time at which the error occurred.|
||UserName|sysname|128|0|0|True||||False|False|The user who executed the batch in which the error occurred.|
||ErrorNumber|int|4|10|0|True||||False|False|The error number of the error that occurred.|
||ErrorSeverity|int|4|10|0|False||||False|False|The severity of the error that occurred.|
||ErrorState|int|4|10|0|False||||False|False|The state number of the error that occurred.|
||ErrorProcedure|nvarchar|126|0|0|False||||False|False|The name of the stored procedure or trigger where the error occurred.|
||ErrorLine|int|4|10|0|False||||False|False|The line number at which the error occurred.|
||ErrorMessage|nvarchar|4000|0|0|True||||False|False|The message text of the error that occurred.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_ErrorLog_ErrorLogID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ErrorLog_ErrorLogID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ErrorLog_ErrorLogID|ErrorLogID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE dbo.ErrorLog (
  ErrorLogID int IDENTITY,
  ErrorTime datetime NOT NULL CONSTRAINT DF_ErrorLog_ErrorTime DEFAULT (getdate()),
  UserName sysname NOT NULL,
  ErrorNumber int NOT NULL,
  ErrorSeverity int NULL,
  ErrorState int NULL,
  ErrorProcedure nvarchar(126) NULL,
  ErrorLine int NULL,
  ErrorMessage nvarchar(4000) NOT NULL,
  CONSTRAINT PK_ErrorLog_ErrorLogID PRIMARY KEY CLUSTERED (ErrorLogID)
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ErrorLog records.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorLogID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The date and time at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorTime'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The user who executed the batch in which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'UserName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The error number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The severity of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorSeverity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The state number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorState'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The name of the stored procedure or trigger where the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorProcedure'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The line number at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorLine'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The message text of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorMessage'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'INDEX', N'PK_ErrorLog_ErrorLogID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'CONSTRAINT', N'PK_ErrorLog_ErrorLogID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'CONSTRAINT', N'DF_ErrorLog_ErrorTime'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`1`_
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial