SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductCategory] (
		[ProductCategoryID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]                  [dbo].[Name] NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_ProductCategory_ProductCategoryID]
		PRIMARY KEY
		CLUSTERED
		([ProductCategoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductCategory]
	ADD
	CONSTRAINT [DF_ProductCategory_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Production].[ProductCategory]
	ADD
	CONSTRAINT [DF_ProductCategory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name]
	ON [Production].[ProductCategory] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid]
	ON [Production].[ProductCategory] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductCategory] SET (LOCK_ESCALATION = TABLE)
GO
