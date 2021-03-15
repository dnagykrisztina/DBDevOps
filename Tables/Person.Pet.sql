CREATE TABLE [Person].[Pet] (
  [PetID] [int] NOT NULL,
  [Name] [nvarchar](25) NULL,
  [Type] [nvarchar](25) NULL,
  [Breed] [nvarchar](10) NULL,
  [Color] [nvarchar](10) NULL,
  [Age] [int] NULL,
  [OwnerID] [int] NULL,
  CONSTRAINT [PK_Pet_ID] PRIMARY KEY CLUSTERED ([PetID])
)
ON [PRIMARY]
GO

ALTER TABLE [Person].[Pet]
  ADD CONSTRAINT [FK_Person_Pet_OwnerID] FOREIGN KEY ([OwnerID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO