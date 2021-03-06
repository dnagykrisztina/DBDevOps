#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Sales.SalesReason

# ![Tables](../../../../Images/Table32.png) [Sales].[SalesReason]

---

## <a name="#description"></a>MS_Description

Lookup table of customer purchase reasons.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 10 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesReason_SalesReasonID: SalesReasonID](../../../../Images/pkcluster.png)](#indexes) | SalesReasonID | int | 4 | NOT NULL | 1 - 1 |  | _Primary key for SalesReason records._ |
|  | Name | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 | NOT NULL |  |  | _Sales reason description._ |
|  | ReasonType | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 | NOT NULL |  |  | _Category the sales reason belongs to._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_SalesReason_SalesReasonID: SalesReasonID](../../../../Images/pkcluster.png)](#indexes) | PK_SalesReason_SalesReasonID | SalesReasonID | YES | _Primary key (clustered) constraint_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Sales].[SalesReason]
(
[SalesReasonID] [int] NOT NULL IDENTITY(1, 1),
[Name] [dbo].[Name] NOT NULL,
[ReasonType] [dbo].[Name] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesReason_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesReason] ADD CONSTRAINT [PK_SalesReason_SalesReasonID] PRIMARY KEY CLUSTERED  ([SalesReasonID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Lookup table of customer purchase reasons.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales reason description.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Category the sales reason belongs to.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'ReasonType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for SalesReason records.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'COLUMN', N'SalesReasonID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'CONSTRAINT', N'DF_SalesReason_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'CONSTRAINT', N'PK_SalesReason_SalesReasonID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesReason', 'INDEX', N'PK_SalesReason_SalesReasonID'
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Sales](../Security/Schemas/Sales.md)


---

## <a name="#usedby"></a>Used By

* [[Sales].[SalesOrderHeaderSalesReason]](SalesOrderHeaderSalesReason.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

