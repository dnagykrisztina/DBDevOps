#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Production.TransactionHistory

# ![Tables](../../../../Images/Table32.png) [Production].[TransactionHistory]

---

## <a name="#description"></a>MS_Description

Record of each purchase order, sales order, or work order transaction year to date.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 113443 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_TransactionHistory_TransactionID: TransactionID](../../../../Images/pkcluster.png)](#indexes) | TransactionID | int | 4 | NOT NULL | 100000 - 1 |  | _Primary key for TransactionHistory records._ |
| [![Indexes IX_TransactionHistory_ProductID](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_TransactionHistory_Product_ProductID: [Production].[Product].ProductID](../../../../Images/fk.png)](#foreignkeys) | ProductID | int | 4 | NOT NULL |  |  | _Product identification number. Foreign key to Product.ProductID._ |
| [![Indexes IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID](../../../../Images/Index.png)](#indexes) | ReferenceOrderID | int | 4 | NOT NULL |  |  | _Purchase order, sales order, or work order identification number._ |
| [![Indexes IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID](../../../../Images/Index.png)](#indexes) | ReferenceOrderLineID | int | 4 | NOT NULL |  | ((0)) | _Line number associated with the purchase order, sales order, or work order._ |
|  | TransactionDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time of the transaction._ |
| [![Check Constraints CK_TransactionHistory_TransactionType : (upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W')](../../../../Images/c-constraint.png)](#checkconstraints) | TransactionType | nchar(1) | 2 | NOT NULL |  |  | _W = WorkOrder, S = SalesOrder, P = PurchaseOrder_ |
|  | Quantity | int | 4 | NOT NULL |  |  | _Product quantity._ |
|  | ActualCost | money | 8 | NOT NULL |  |  | _Product cost._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_TransactionHistory_TransactionID: TransactionID](../../../../Images/pkcluster.png)](#indexes) | PK_TransactionHistory_TransactionID | TransactionID | YES | _Primary key (clustered) constraint_ |
|  | IX_TransactionHistory_ProductID | ProductID |  | _Nonclustered index._ |
|  | IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID | ReferenceOrderID, ReferenceOrderLineID |  | _Nonclustered index._ |


---

## <a name="#checkconstraints"></a>Check Constraints

| Name | On Column | Constraint | Description |
|---|---|---|---|
| CK_TransactionHistory_TransactionType | TransactionType | (upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W') | _Check constraint [TransactionType]='p' OR [TransactionType]='s' OR [TransactionType]='w' OR [TransactionType]='P' OR [TransactionType]='S' OR [TransactionType]='W')_ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_TransactionHistory_Product_ProductID | ProductID->[[Production].[Product].[ProductID]](Product.md) | _Foreign key constraint referencing Product.ProductID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Production].[TransactionHistory]
(
[TransactionID] [int] NOT NULL IDENTITY(100000, 1),
[ProductID] [int] NOT NULL,
[ReferenceOrderID] [int] NOT NULL,
[ReferenceOrderLineID] [int] NOT NULL CONSTRAINT [DF_TransactionHistory_ReferenceOrderLineID] DEFAULT ((0)),
[TransactionDate] [datetime] NOT NULL CONSTRAINT [DF_TransactionHistory_TransactionDate] DEFAULT (getdate()),
[TransactionType] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Quantity] [int] NOT NULL,
[ActualCost] [money] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_TransactionHistory_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory] ADD CONSTRAINT [CK_TransactionHistory_TransactionType] CHECK ((upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W'))
GO
ALTER TABLE [Production].[TransactionHistory] ADD CONSTRAINT [PK_TransactionHistory_TransactionID] PRIMARY KEY CLUSTERED  ([TransactionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory] ([ProductID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistory] ([ReferenceOrderID], [ReferenceOrderLineID]) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory] ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Record of each purchase order, sales order, or work order transaction year to date.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product cost.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'ActualCost'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product quantity.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'Quantity'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Purchase order, sales order, or work order identification number.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'ReferenceOrderID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Line number associated with the purchase order, sales order, or work order.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'ReferenceOrderLineID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time of the transaction.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'TransactionDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for TransactionHistory records.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'TransactionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'W = WorkOrder, S = SalesOrder, P = PurchaseOrder', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'COLUMN', N'TransactionType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W'')', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'CK_TransactionHistory_TransactionType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'DF_TransactionHistory_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'DF_TransactionHistory_ReferenceOrderLineID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'DF_TransactionHistory_TransactionDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'FK_TransactionHistory_Product_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'CONSTRAINT', N'PK_TransactionHistory_TransactionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'INDEX', N'IX_TransactionHistory_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'INDEX', N'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'TransactionHistory', 'INDEX', N'PK_TransactionHistory_TransactionID'
GO

```


---

## <a name="#uses"></a>Uses

* [[Production].[Product]](Product.md)
* [Production](../Security/Schemas/Production.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

