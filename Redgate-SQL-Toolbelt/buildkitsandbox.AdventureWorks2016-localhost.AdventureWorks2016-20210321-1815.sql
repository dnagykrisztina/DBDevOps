/*
Run this script on:

        localhost.AdventureWorks2016    -  This database will be modified

to synchronize it with a database with the schema represented by:

        buildkitsandbox.AdventureWorks2016

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.4.4.16824 from Red Gate Software Ltd at 2021. 03. 21. 18:24:59

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [FK_Person_PetID]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [Person].[Pet]'
GO
ALTER TABLE [Person].[Pet] DROP CONSTRAINT [FK_Pet_OwnerID]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [Person].[Pet]'
GO
ALTER TABLE [Person].[Pet] DROP CONSTRAINT [PK_Pet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [Person].[Pet]'
GO
DROP TABLE [Person].[Pet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [Person].[Person]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [Person].[Person] DROP
COLUMN [PetID]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [HumanResources].[vEmployee]'
GO
EXEC sp_refreshview N'[HumanResources].[vEmployee]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [HumanResources].[vEmployeeDepartment]'
GO
EXEC sp_refreshview N'[HumanResources].[vEmployeeDepartment]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [HumanResources].[vEmployeeDepartmentHistory]'
GO
EXEC sp_refreshview N'[HumanResources].[vEmployeeDepartmentHistory]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Person].[vAdditionalContactInfo]'
GO
EXEC sp_refreshview N'[Person].[vAdditionalContactInfo]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Purchasing].[vVendorWithContacts]'
GO
EXEC sp_refreshview N'[Purchasing].[vVendorWithContacts]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Sales].[vIndividualCustomer]'
GO
EXEC sp_refreshview N'[Sales].[vIndividualCustomer]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Sales].[vPersonDemographics]'
GO
EXEC sp_refreshview N'[Sales].[vPersonDemographics]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Sales].[vSalesPerson]'
GO
EXEC sp_refreshview N'[Sales].[vSalesPerson]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Sales].[vSalesPersonSalesByFiscalYears]'
GO
EXEC sp_refreshview N'[Sales].[vSalesPersonSalesByFiscalYears]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [Sales].[vStoreWithContacts]'
GO
EXEC sp_refreshview N'[Sales].[vStoreWithContacts]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
