SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatabaseLog] (
		[DatabaseLogID]     [int] IDENTITY(1, 1) NOT NULL,
		[PostTime]          [datetime] NOT NULL,
		[DatabaseUser]      [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Event]             [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Schema]            [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Object]            [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TSQL]              [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[XmlEvent]          [xml] NOT NULL,
		CONSTRAINT [PK_DatabaseLog_DatabaseLogID]
		PRIMARY KEY
		NONCLUSTERED
		([DatabaseLogID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatabaseLog] SET (LOCK_ESCALATION = TABLE)
GO
