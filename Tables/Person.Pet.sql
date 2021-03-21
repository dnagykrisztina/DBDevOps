CREATE TABLE [Person].[Pet]
(
[PetID] [int] NOT NULL,
[Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Breed] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Pet] ADD CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED  ([PetID]) ON [PRIMARY]
GO
ALTER TABLE [Person].[Pet] ADD CONSTRAINT [FK_Pet_OwnerID] FOREIGN KEY ([OwnerID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO
