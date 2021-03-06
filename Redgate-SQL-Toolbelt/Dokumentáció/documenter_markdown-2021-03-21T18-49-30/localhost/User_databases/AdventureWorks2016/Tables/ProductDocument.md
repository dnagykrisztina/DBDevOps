#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Production.ProductDocument

# ![Tables](../../../../Images/Table32.png) [Production].[ProductDocument]

---

## <a name="#description"></a>MS_Description

Cross-reference table mapping products to related product documents.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 32 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductDocument_ProductID_DocumentNode: ProductID\DocumentNode](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_ProductDocument_Product_ProductID: [Production].[Product].ProductID](../../../../Images/fk.png)](#foreignkeys) | ProductID | int | 4 | NOT NULL |  | _Product identification number. Foreign key to Product.ProductID._ |
| [![Cluster Primary Key PK_ProductDocument_ProductID_DocumentNode: ProductID\DocumentNode](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_ProductDocument_Document_DocumentNode: [Production].[Document].DocumentNode](../../../../Images/fk.png)](#foreignkeys) | DocumentNode | hierarchyid | 892 | NOT NULL |  | _Document identification number. Foreign key to Document.DocumentNode._ |
|  | ModifiedDate | datetime | 8 | NOT NULL | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductDocument_ProductID_DocumentNode: ProductID\DocumentNode](../../../../Images/pkcluster.png)](#indexes) | PK_ProductDocument_ProductID_DocumentNode | ProductID, DocumentNode | YES | _Primary key (clustered) constraint_ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_ProductDocument_Document_DocumentNode | DocumentNode->[[Production].[Document].[DocumentNode]](Document.md) | _Foreign key constraint referencing Document.DocumentNode._ |
| FK_ProductDocument_Product_ProductID | ProductID->[[Production].[Product].[ProductID]](Product.md) | _Foreign key constraint referencing Product.ProductID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Production].[ProductDocument]
(
[ProductID] [int] NOT NULL,
[DocumentNode] [sys].[hierarchyid] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductDocument_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductDocument] ADD CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode] PRIMARY KEY CLUSTERED  ([ProductID], [DocumentNode]) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductDocument] ADD CONSTRAINT [FK_ProductDocument_Document_DocumentNode] FOREIGN KEY ([DocumentNode]) REFERENCES [Production].[Document] ([DocumentNode])
GO
ALTER TABLE [Production].[ProductDocument] ADD CONSTRAINT [FK_ProductDocument_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping products to related product documents.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Document identification number. Foreign key to Document.DocumentNode.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'DocumentNode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'COLUMN', N'ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'DF_ProductDocument_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Document.DocumentNode.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'FK_ProductDocument_Document_DocumentNode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'FK_ProductDocument_Product_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'CONSTRAINT', N'PK_ProductDocument_ProductID_DocumentNode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductDocument', 'INDEX', N'PK_ProductDocument_ProductID_DocumentNode'
GO

```


---

## <a name="#uses"></a>Uses

* [[Production].[Document]](Document.md)
* [[Production].[Product]](Product.md)
* [Production](../Security/Schemas/Production.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

