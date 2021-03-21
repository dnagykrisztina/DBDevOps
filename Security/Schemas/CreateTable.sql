CREATE SCHEMA [CreateTable]
AUTHORIZATION [dbo]
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'tSQLt.TestClass', @xp, 'SCHEMA', N'CreateTable', NULL, NULL, NULL, NULL
GO
