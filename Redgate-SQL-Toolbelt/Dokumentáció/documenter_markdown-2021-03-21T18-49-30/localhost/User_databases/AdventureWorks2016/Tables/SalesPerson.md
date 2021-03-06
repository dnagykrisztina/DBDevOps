#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Sales.SalesPerson

# ![Tables](../../../../Images/Table32.png) [Sales].[SalesPerson]

---

## <a name="#description"></a>MS_Description

Sales representative current information.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 17 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesPerson_BusinessEntityID: BusinessEntityID](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_SalesPerson_Employee_BusinessEntityID: [HumanResources].[Employee].BusinessEntityID](../../../../Images/fk.png)](#foreignkeys) | BusinessEntityID | int | 4 | NOT NULL |  | _Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID_ |
| [![Foreign Keys FK_SalesPerson_SalesTerritory_TerritoryID: [Sales].[SalesTerritory].TerritoryID](../../../../Images/fk.png)](#foreignkeys) | TerritoryID | int | 4 | NULL allowed |  | _Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID._ |
| [![Check Constraints CK_SalesPerson_SalesQuota : ([SalesQuota]>(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | SalesQuota | money | 8 | NULL allowed |  | _Projected yearly sales._ |
| [![Check Constraints CK_SalesPerson_Bonus : ([Bonus]>=(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | Bonus | money | 8 | NOT NULL | ((0.00)) | _Bonus due if quota is met._ |
| [![Check Constraints CK_SalesPerson_CommissionPct : ([CommissionPct]>=(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | CommissionPct | smallmoney | 4 | NOT NULL | ((0.00)) | _Commision percent received per sale._ |
| [![Check Constraints CK_SalesPerson_SalesYTD : ([SalesYTD]>=(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | SalesYTD | money | 8 | NOT NULL | ((0.00)) | _Sales total year to date._ |
| [![Check Constraints CK_SalesPerson_SalesLastYear : ([SalesLastYear]>=(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | SalesLastYear | money | 8 | NOT NULL | ((0.00)) | _Sales total of previous year._ |
| [![Indexes AK_SalesPerson_rowguid](../../../../Images/Index.png)](#indexes) | rowguid | uniqueidentifier | 16 | NOT NULL | (newid()) | _ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample._ |
|  | ModifiedDate | datetime | 8 | NOT NULL | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesPerson_BusinessEntityID: BusinessEntityID](../../../../Images/pkcluster.png)](#indexes) | PK_SalesPerson_BusinessEntityID | BusinessEntityID | YES | _Primary key (clustered) constraint_ |
|  | AK_SalesPerson_rowguid | rowguid | YES | _Unique nonclustered index. Used to support replication samples._ |


---

## <a name="#checkconstraints"></a>Check Constraints

| Name | On Column | Constraint | Description |
|---|---|---|---|
| CK_SalesPerson_Bonus | Bonus | ([Bonus]>=(0.00)) | _Check constraint [Bonus] >= (0.00)_ |
| CK_SalesPerson_CommissionPct | CommissionPct | ([CommissionPct]>=(0.00)) | _Check constraint [CommissionPct] >= (0.00)_ |
| CK_SalesPerson_SalesLastYear | SalesLastYear | ([SalesLastYear]>=(0.00)) | _Check constraint [SalesLastYear] >= (0.00)_ |
| CK_SalesPerson_SalesQuota | SalesQuota | ([SalesQuota]>(0.00)) | _Check constraint [SalesQuota] > (0.00)_ |
| CK_SalesPerson_SalesYTD | SalesYTD | ([SalesYTD]>=(0.00)) | _Check constraint [SalesYTD] >= (0.00)_ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_SalesPerson_Employee_BusinessEntityID | BusinessEntityID->[[HumanResources].[Employee].[BusinessEntityID]](Employee.md) | _Foreign key constraint referencing Employee.EmployeeID._ |
| FK_SalesPerson_SalesTerritory_TerritoryID | TerritoryID->[[Sales].[SalesTerritory].[TerritoryID]](SalesTerritory.md) | _Foreign key constraint referencing SalesTerritory.TerritoryID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Sales].[SalesPerson]
(
[BusinessEntityID] [int] NOT NULL,
[TerritoryID] [int] NULL,
[SalesQuota] [money] NULL,
[Bonus] [money] NOT NULL CONSTRAINT [DF_SalesPerson_Bonus] DEFAULT ((0.00)),
[CommissionPct] [smallmoney] NOT NULL CONSTRAINT [DF_SalesPerson_CommissionPct] DEFAULT ((0.00)),
[SalesYTD] [money] NOT NULL CONSTRAINT [DF_SalesPerson_SalesYTD] DEFAULT ((0.00)),
[SalesLastYear] [money] NOT NULL CONSTRAINT [DF_SalesPerson_SalesLastYear] DEFAULT ((0.00)),
[rowguid] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_SalesPerson_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesPerson_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [CK_SalesPerson_Bonus] CHECK (([Bonus]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [CK_SalesPerson_CommissionPct] CHECK (([CommissionPct]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [CK_SalesPerson_SalesLastYear] CHECK (([SalesLastYear]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [CK_SalesPerson_SalesQuota] CHECK (([SalesQuota]>(0.00)))
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [CK_SalesPerson_SalesYTD] CHECK (([SalesYTD]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [PK_SalesPerson_BusinessEntityID] PRIMARY KEY CLUSTERED  ([BusinessEntityID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid] ON [Sales].[SalesPerson] ([rowguid]) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO
ALTER TABLE [Sales].[SalesPerson] ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales representative current information.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Bonus due if quota is met.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'Bonus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Commision percent received per sale.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'CommissionPct'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales total of previous year.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesLastYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Projected yearly sales.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesQuota'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales total year to date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'SalesYTD'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'COLUMN', N'TerritoryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [Bonus] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_Bonus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [CommissionPct] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_CommissionPct'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [SalesLastYear] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesLastYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesQuota'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [SalesYTD] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'CK_SalesPerson_SalesYTD'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_Bonus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_CommissionPct'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_SalesLastYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'DF_SalesPerson_SalesYTD'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'FK_SalesPerson_Employee_BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'FK_SalesPerson_SalesTerritory_TerritoryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'CONSTRAINT', N'PK_SalesPerson_BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'INDEX', N'AK_SalesPerson_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPerson', 'INDEX', N'PK_SalesPerson_BusinessEntityID'
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[Employee]](Employee.md)
* [[Sales].[SalesTerritory]](SalesTerritory.md)
* [Sales](../Security/Schemas/Sales.md)


---

## <a name="#usedby"></a>Used By

* [[Sales].[SalesOrderHeader]](SalesOrderHeader.md)
* [[Sales].[SalesPersonQuotaHistory]](SalesPersonQuotaHistory.md)
* [[Sales].[SalesTerritoryHistory]](SalesTerritoryHistory.md)
* [[Sales].[Store]](Store.md)
* [[Sales].[vSalesPerson]](../Views/vSalesPerson.md)
* [[Sales].[vSalesPersonSalesByFiscalYears]](../Views/vSalesPersonSalesByFiscalYears.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

