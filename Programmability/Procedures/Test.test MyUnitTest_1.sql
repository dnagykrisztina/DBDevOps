SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [Test].[test MyUnitTest_1]
AS
BEGIN
  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Pet]', @Message = N'Fail'

END;
GO