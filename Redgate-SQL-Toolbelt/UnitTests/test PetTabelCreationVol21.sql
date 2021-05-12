USE [AdventureWorks2016]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [CreateTable].[test Pet table creation]
AS
BEGIN

  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Pet]', @Message = N'Fail'
  
END;


