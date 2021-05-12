--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
ALTER PROCEDURE Test.[test MyUnitTest_1]
AS
BEGIN
  EXEC tSQLt.AssertObjectExists @ObjectName = N'[Person].[Pet]', @Message = N'Fail'

END;