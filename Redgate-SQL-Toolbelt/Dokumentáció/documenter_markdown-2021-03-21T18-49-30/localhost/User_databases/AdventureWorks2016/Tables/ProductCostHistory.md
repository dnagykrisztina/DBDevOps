#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Production.ProductCostHistory

# ![Tables](../../../../Images/Table32.png) [Production].[ProductCostHistory]

---

## <a name="#description"></a>MS_Description

Changes in the cost of a product over time.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 395 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductCostHistory_ProductID_StartDate: ProductID\StartDate](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_ProductCostHistory_Product_ProductID: [Production].[Product].ProductID](../../../../Images/fk.png)](#foreignkeys) | ProductID | int | 4 | NOT NULL |  | _Product identification number. Foreign key to Product.ProductID_ |
| [![Cluster Primary Key PK_ProductCostHistory_ProductID_StartDate: ProductID\StartDate](../../../../Images/pkcluster.png)](#indexes) | StartDate | datetime | 8 | NOT NULL |  | _Product cost start date._ |
|  | EndDate | datetime | 8 | NULL allowed |  | _Product cost end date._ |
| [![Check Constraints CK_ProductCostHistory_StandardCost : ([StandardCost]>=(0.00))](../../../../Images/c-constraint.png)](#checkconstraints) | StandardCost | money | 8 | NOT NULL |  | _Standard cost of the product._ |
|  | ModifiedDate | datetime | 8 | NOT NULL | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductCostHistory_ProductID_StartDate: ProductID\StartDate](../../../../Images/pkcluster.png)](#indexes) | PK_ProductCostHistory_ProductID_StartDate | ProductID, StartDate | YES | _Primary key (clustered) constraint_ |


---

## <a name="#checkconstraints"></a>Check Constraints

| Name | On Column | Constraint | Description |
|---|---|---|---|
| CK_ProductCostHistory_EndDate |  | ([EndDate]>=[StartDate] OR [EndDate] IS NULL) | _Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL_ |
| CK_ProductCostHistory_StandardCost | StandardCost | ([StandardCost]>=(0.00)) | _Check constraint [StandardCost] >= (0.00)_ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_ProductCostHistory_Product_ProductID | ProductID->[[Production].[Product].[ProductID]](Product.md) | _Foreign key constraint referencing Product.ProductID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Production].[ProductCostHistory]
(
[ProductID] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NULL,
[StandardCost] [money] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCostHistory_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductCostHistory] ADD CONSTRAINT [CK_ProductCostHistory_EndDate] CHECK (([EndDate]>=[StartDate] OR [EndDate] IS NULL))
GO
ALTER TABLE [Production].[ProductCostHistory] ADD CONSTRAINT [CK_ProductCostHistory_StandardCost] CHECK (([StandardCost]>=(0.00)))
GO
ALTER TABLE [Production].[ProductCostHistory] ADD CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate] PRIMARY KEY CLUSTERED  ([ProductID], [StartDate]) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductCostHistory] ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Changes in the cost of a product over time.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product cost end date.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Standard cost of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'StandardCost'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product cost start date.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'CK_ProductCostHistory_EndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Check constraint [StandardCost] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'CK_ProductCostHistory_StandardCost'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'DF_ProductCostHistory_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'FK_ProductCostHistory_Product_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'CONSTRAINT', N'PK_ProductCostHistory_ProductID_StartDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductCostHistory', 'INDEX', N'PK_ProductCostHistory_ProductID_StartDate'
GO

```


---

## <a name="#uses"></a>Uses

* [[Production].[Product]](Product.md)
* [Production](../Security/Schemas/Production.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ufnGetProductStandardCost]](../Programmability/Functions/Scalar-valued_Functions/ufnGetProductStandardCost.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

