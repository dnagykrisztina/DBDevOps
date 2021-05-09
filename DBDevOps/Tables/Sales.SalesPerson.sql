SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SalesPerson] (
		[BusinessEntityID]     [int] NOT NULL,
		[TerritoryID]          [int] NULL,
		[SalesQuota]           [money] NULL,
		[Bonus]                [money] NOT NULL,
		[CommissionPct]        [smallmoney] NOT NULL,
		[SalesYTD]             [money] NOT NULL,
		[SalesLastYear]        [money] NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_SalesPerson_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [CK_SalesPerson_SalesQuota]
	CHECK
	([SalesQuota]>(0.00))
GO
ALTER TABLE [Sales].[SalesPerson]
CHECK CONSTRAINT [CK_SalesPerson_SalesQuota]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [CK_SalesPerson_Bonus]
	CHECK
	([Bonus]>=(0.00))
GO
ALTER TABLE [Sales].[SalesPerson]
CHECK CONSTRAINT [CK_SalesPerson_Bonus]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [CK_SalesPerson_CommissionPct]
	CHECK
	([CommissionPct]>=(0.00))
GO
ALTER TABLE [Sales].[SalesPerson]
CHECK CONSTRAINT [CK_SalesPerson_CommissionPct]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [CK_SalesPerson_SalesYTD]
	CHECK
	([SalesYTD]>=(0.00))
GO
ALTER TABLE [Sales].[SalesPerson]
CHECK CONSTRAINT [CK_SalesPerson_SalesYTD]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [CK_SalesPerson_SalesLastYear]
	CHECK
	([SalesLastYear]>=(0.00))
GO
ALTER TABLE [Sales].[SalesPerson]
CHECK CONSTRAINT [CK_SalesPerson_SalesLastYear]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_Bonus]
	DEFAULT ((0.00)) FOR [Bonus]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_CommissionPct]
	DEFAULT ((0.00)) FOR [CommissionPct]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_SalesYTD]
	DEFAULT ((0.00)) FOR [SalesYTD]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_SalesLastYear]
	DEFAULT ((0.00)) FOR [SalesLastYear]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SalesPerson]
	ADD
	CONSTRAINT [DF_SalesPerson_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesPerson]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesPerson]
	CHECK CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]

GO
ALTER TABLE [Sales].[SalesPerson]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesPerson]
	CHECK CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid]
	ON [Sales].[SalesPerson] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPerson] SET (LOCK_ESCALATION = TABLE)
GO
