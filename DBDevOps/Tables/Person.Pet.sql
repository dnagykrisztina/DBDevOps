SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Pet] (
		[PetID]       [int] NOT NULL,
		[Name]        [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Color]       [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Type]        [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Breed]       [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[OwnerID]     [int] NULL,
		CONSTRAINT [PK_Pet]
		PRIMARY KEY
		CLUSTERED
		([PetID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Pet]
	WITH CHECK
	ADD CONSTRAINT [FK_Pet_Owner]
	FOREIGN KEY ([OwnerID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[Pet]
	CHECK CONSTRAINT [FK_Pet_Owner]

GO
ALTER TABLE [Person].[Pet]
	WITH CHECK
	ADD CONSTRAINT [FK_Pet_Pet]
	FOREIGN KEY ([PetID]) REFERENCES [Person].[Pet] ([PetID])
ALTER TABLE [Person].[Pet]
	CHECK CONSTRAINT [FK_Pet_Pet]

GO
ALTER TABLE [Person].[Pet] SET (LOCK_ESCALATION = TABLE)
GO
