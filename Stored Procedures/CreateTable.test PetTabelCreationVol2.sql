SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CreateTable].[test PetTabelCreationVol2]
AS
BEGIN
  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Pet]', @Message = N'Fail'
  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Person]', @Message = N'Fail'
  
END;


GO
