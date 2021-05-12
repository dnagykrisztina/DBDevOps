#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Production.ProductPhoto

# ![Tables](../../../../Images/Table32.png) [Production].[ProductPhoto]

---

## <a name="#description"></a>MS_Description

Product images.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 101 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductPhoto_ProductPhotoID: ProductPhotoID](../../../../Images/pkcluster.png)](#indexes) | ProductPhotoID | int | 4 | NOT NULL | 1 - 1 |  | _Primary key for ProductPhoto records._ |
|  | ThumbNailPhoto | varbinary(max) | max | NULL allowed |  |  | _Small image of the product._ |
|  | ThumbnailPhotoFileName | nvarchar(50) | 100 | NULL allowed |  |  | _Small image file name._ |
|  | LargePhoto | varbinary(max) | max | NULL allowed |  |  | _Large image of the product._ |
|  | LargePhotoFileName | nvarchar(50) | 100 | NULL allowed |  |  | _Large image file name._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_ProductPhoto_ProductPhotoID: ProductPhotoID](../../../../Images/pkcluster.png)](#indexes) | PK_ProductPhoto_ProductPhotoID | ProductPhotoID | YES | _Primary key (clustered) constraint_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Production].[ProductPhoto]
(
[ProductPhotoID] [int] NOT NULL IDENTITY(1, 1),
[ThumbNailPhoto] [varbinary] (max) NULL,
[ThumbnailPhotoFileName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LargePhoto] [varbinary] (max) NULL,
[LargePhotoFileName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductPhoto_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductPhoto] ADD CONSTRAINT [PK_ProductPhoto_ProductPhotoID] PRIMARY KEY CLUSTERED  ([ProductPhotoID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product images.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Large image of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'LargePhoto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Large image file name.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'LargePhotoFileName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for ProductPhoto records.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ProductPhotoID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Small image of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ThumbNailPhoto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Small image file name.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'COLUMN', N'ThumbnailPhotoFileName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'CONSTRAINT', N'DF_ProductPhoto_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'CONSTRAINT', N'PK_ProductPhoto_ProductPhotoID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductPhoto', 'INDEX', N'PK_ProductPhoto_ProductPhotoID'
GO

```


---

## <a name="#uses"></a>Uses

* [Production](../Security/Schemas/Production.md)


---

## <a name="#usedby"></a>Used By

* [[Production].[ProductProductPhoto]](ProductProductPhoto.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

