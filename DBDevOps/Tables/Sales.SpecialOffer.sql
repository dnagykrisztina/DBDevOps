SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SpecialOffer] (
		[SpecialOfferID]     [int] IDENTITY(1, 1) NOT NULL,
		[Description]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DiscountPct]        [smallmoney] NOT NULL,
		[Type]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Category]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StartDate]          [datetime] NOT NULL,
		[EndDate]            [datetime] NOT NULL,
		[MinQty]             [int] NOT NULL,
		[MaxQty]             [int] NULL,
		[rowguid]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_SpecialOffer_SpecialOfferID]
		PRIMARY KEY
		CLUSTERED
		([SpecialOfferID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [CK_SpecialOffer_EndDate]
	CHECK
	([EndDate]>=[StartDate])
GO
ALTER TABLE [Sales].[SpecialOffer]
CHECK CONSTRAINT [CK_SpecialOffer_EndDate]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [CK_SpecialOffer_DiscountPct]
	CHECK
	([DiscountPct]>=(0.00))
GO
ALTER TABLE [Sales].[SpecialOffer]
CHECK CONSTRAINT [CK_SpecialOffer_DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [CK_SpecialOffer_MinQty]
	CHECK
	([MinQty]>=(0))
GO
ALTER TABLE [Sales].[SpecialOffer]
CHECK CONSTRAINT [CK_SpecialOffer_MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [CK_SpecialOffer_MaxQty]
	CHECK
	([MaxQty]>=(0))
GO
ALTER TABLE [Sales].[SpecialOffer]
CHECK CONSTRAINT [CK_SpecialOffer_MaxQty]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [DF_SpecialOffer_DiscountPct]
	DEFAULT ((0.00)) FOR [DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [DF_SpecialOffer_MinQty]
	DEFAULT ((0)) FOR [MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [DF_SpecialOffer_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SpecialOffer]
	ADD
	CONSTRAINT [DF_SpecialOffer_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOffer_rowguid]
	ON [Sales].[SpecialOffer] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOffer] SET (LOCK_ESCALATION = TABLE)
GO
