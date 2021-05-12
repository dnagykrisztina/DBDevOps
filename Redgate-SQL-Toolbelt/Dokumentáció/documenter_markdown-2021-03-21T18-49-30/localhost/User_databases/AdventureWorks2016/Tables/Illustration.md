#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Production.Illustration

# ![Tables](../../../../Images/Table32.png) [Production].[Illustration]

---

## <a name="#description"></a>MS_Description

Bicycle assembly diagrams.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 5 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Illustration_IllustrationID: IllustrationID](../../../../Images/pkcluster.png)](#indexes) | IllustrationID | int | 4 | NOT NULL | 1 - 1 |  | _Primary key for Illustration records._ |
|  | Diagram | xml | max | NULL allowed |  |  | _Illustrations used in manufacturing instructions. Stored as XML._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_Illustration_IllustrationID: IllustrationID](../../../../Images/pkcluster.png)](#indexes) | PK_Illustration_IllustrationID | IllustrationID | YES | _Primary key (clustered) constraint_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Production].[Illustration]
(
[IllustrationID] [int] NOT NULL IDENTITY(1, 1),
[Diagram] [xml] NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Illustration_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Illustration] ADD CONSTRAINT [PK_Illustration_IllustrationID] PRIMARY KEY CLUSTERED  ([IllustrationID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Bicycle assembly diagrams.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Illustrations used in manufacturing instructions. Stored as XML.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'Diagram'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for Illustration records.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'IllustrationID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'CONSTRAINT', N'DF_Illustration_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'CONSTRAINT', N'PK_Illustration_IllustrationID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'INDEX', N'PK_Illustration_IllustrationID'
GO

```


---

## <a name="#uses"></a>Uses

* [Production](../Security/Schemas/Production.md)


---

## <a name="#usedby"></a>Used By

* [[Production].[ProductModelIllustration]](ProductModelIllustration.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

