SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [CreateTable].[test PersonTableCreation]
AS
BEGIN
  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Person]', @Message = N'Fail'
  
END;


GO
