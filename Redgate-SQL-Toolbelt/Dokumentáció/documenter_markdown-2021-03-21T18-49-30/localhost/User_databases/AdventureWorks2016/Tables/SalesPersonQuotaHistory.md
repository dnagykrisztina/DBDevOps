#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Sales.SalesPersonQuotaHistory

# ![Tables](../../../../Images/Table32.png) [Sales].[SalesPersonQuotaHistory]

---

## <a name="#description"></a>MS_Description

Sales performance tracking.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 163 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate: BusinessEntityID\QuotaDate](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID: [Sales].[SalesPerson].BusinessEntityID](../../../../Images/fk.png)](#foreignkeys) | BusinessEntityID | int | 4 | NOT NULL |  | _Sales person identification number. Foreign key to SalesPerson.BusinessEntityID._ |
| [![Cluster Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate: BusinessEntityID\QuotaDate](../../../../Images/pkcluster.png)](#indexes) | QuotaDate | datetime | 8 | NOT NULL |  | _Sales quota date._ |
| [![Check Constraints CK_SalesPersonQuotaHistory_SalesQuota : ([SalesQuota]>(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | SalesQuota | money | 8 | NOT NULL |  | _Sales quota amount._ |
| [![Indexes AK_SalesPersonQuotaHistory_rowguid](../../../../Images/Index.png)](#indexes) | rowguid | uniqueidentifier | 16 | NOT NULL | (newid()) | _ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample._ |
|  | ModifiedDate | datetime | 8 | NOT NULL | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate: BusinessEntityID\QuotaDate](../../../../Images/pkcluster.png)](#indexes) | PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate | BusinessEntityID, QuotaDate | YES | _Primary key (clustered) constraint_ |
|  | AK_SalesPersonQuotaHistory_rowguid | rowguid | YES | _Unique nonclustered index. Used to support replication samples._ |


---

## <a name="#checkconstraints"></a>Check Constraints

| Name | On Column | Constraint | Description |
|---|---|---|---|
| CK_SalesPersonQuotaHistory_SalesQuota | SalesQuota | ([SalesQuota]>(0.00)) | _Check constraint [SalesQuota] > (0.00)_ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID | BusinessEntityID->[[Sales].[SalesPerson].[BusinessEntityID]](SalesPerson.md) | _Foreign key constraint referencing SalesPerson.SalesPersonID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Sales].[SalesPersonQuotaHistory]
(
[BusinessEntityID] [int] NOT NULL,
[QuotaDate] [datetime] NOT NULL,
[SalesQuota] [money] NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_SalesPersonQuotaHistory_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] ADD CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota] CHECK (([SalesQuota]>(0.00)))
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] ADD CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY CLUSTERED  ([BusinessEntityID], [QuotaDate]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid] ON [Sales].[SalesPersonQuotaHistory] ([rowguid]) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales performance tracking.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales quota date.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'QuotaDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales quota amount.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'COLUMN', N'SalesQuota'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'CK_SalesPersonQuotaHistory_SalesQuota'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'DF_SalesPersonQuotaHistory_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'DF_SalesPersonQuotaHistory_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'CONSTRAINT', N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'INDEX', N'AK_SalesPersonQuotaHistory_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesPersonQuotaHistory', 'INDEX', N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
GO

```


---

## <a name="#uses"></a>Uses

* [[Sales].[SalesPerson]](SalesPerson.md)
* [Sales](../Security/Schemas/Sales.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

