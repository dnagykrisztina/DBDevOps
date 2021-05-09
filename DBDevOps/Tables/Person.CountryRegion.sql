SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[CountryRegion] (
		[CountryRegionCode]     [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Name]                  [dbo].[Name] NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_CountryRegion_CountryRegionCode]
		PRIMARY KEY
		CLUSTERED
		([CountryRegionCode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[CountryRegion]
	ADD
	CONSTRAINT [DF_CountryRegion_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CountryRegion_Name]
	ON [Person].[CountryRegion] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[CountryRegion] SET (LOCK_ESCALATION = TABLE)
GO
