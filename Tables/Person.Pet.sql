CREATE TABLE [Person].[Pet] (
  [PetID] [int] NOT NULL,
  [Name] [nvarchar](25) NOT NULL,
  [Type] [nvarchar](25) NOT NULL,
  [Breed] [nvarchar](25) NULL,
  [Color] [nvarchar](25) NOT NULL,
  [Age] [int] NULL,
  [OwnerID] [int] NOT NULL,
  CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED ([PetID])
)
ON [PRIMARY]
GO

ALTER TABLE [Person].[Pet]
  ADD CONSTRAINT [FK_Pet_Person_OwnerID] FOREIGN KEY ([OwnerID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Connection between the pet and its owner', 'SCHEMA', N'Person', 'TABLE', N'Pet', 'CONSTRAINT', N'FK_Pet_Person_OwnerID'
GO