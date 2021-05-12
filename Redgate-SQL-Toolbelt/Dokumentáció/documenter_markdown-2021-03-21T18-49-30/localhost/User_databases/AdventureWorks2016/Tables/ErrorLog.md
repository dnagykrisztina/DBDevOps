#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > dbo.ErrorLog

# ![Tables](../../../../Images/Table32.png) [dbo].[ErrorLog]

---

## <a name="#description"></a>MS_Description

Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:40 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ErrorLog_ErrorLogID: ErrorLogID](../../../../Images/pkcluster.png)](#indexes) | ErrorLogID | int | 4 | NOT NULL | 1 - 1 |  | _Primary key for ErrorLog records._ |
|  | ErrorTime | datetime | 8 | NOT NULL |  | (getdate()) | _The date and time at which the error occurred._ |
|  | UserName | [sys].[sysname] | 256 | NOT NULL |  |  | _The user who executed the batch in which the error occurred._ |
|  | ErrorNumber | int | 4 | NOT NULL |  |  | _The error number of the error that occurred._ |
|  | ErrorSeverity | int | 4 | NULL allowed |  |  | _The severity of the error that occurred._ |
|  | ErrorState | int | 4 | NULL allowed |  |  | _The state number of the error that occurred._ |
|  | ErrorProcedure | nvarchar(126) | 252 | NULL allowed |  |  | _The name of the stored procedure or trigger where the error occurred._ |
|  | ErrorLine | int | 4 | NULL allowed |  |  | _The line number at which the error occurred._ |
|  | ErrorMessage | nvarchar(4000) | 8000 | NOT NULL |  |  | _The message text of the error that occurred._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_ErrorLog_ErrorLogID: ErrorLogID](../../../../Images/pkcluster.png)](#indexes) | PK_ErrorLog_ErrorLogID | ErrorLogID | YES | _Primary key (clustered) constraint_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[ErrorLog]
(
[ErrorLogID] [int] NOT NULL IDENTITY(1, 1),
[ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (getdate()),
[UserName] [sys].[sysname] NOT NULL,
[ErrorNumber] [int] NOT NULL,
[ErrorSeverity] [int] NULL,
[ErrorState] [int] NULL,
[ErrorProcedure] [nvarchar] (126) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorLine] [int] NULL,
[ErrorMessage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog] ADD CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED  ([ErrorLogID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The line number at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorLine'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for ErrorLog records.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The message text of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The error number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the stored procedure or trigger where the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorProcedure'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The severity of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorSeverity'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The state number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date and time at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'ErrorTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The user who executed the batch in which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'COLUMN', N'UserName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'CONSTRAINT', N'DF_ErrorLog_ErrorTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'CONSTRAINT', N'PK_ErrorLog_ErrorLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog', 'INDEX', N'PK_ErrorLog_ErrorLogID'
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[uspLogError]](../Programmability/Stored_Procedures/uspLogError.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

