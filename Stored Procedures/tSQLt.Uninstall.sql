SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [tSQLt].[Uninstall]
AS
BEGIN
  DROP TYPE tSQLt.Private;

  EXEC tSQLt.DropClass 'tSQLt';  
  
  DROP ASSEMBLY tSQLtCLR;
END;
GO
