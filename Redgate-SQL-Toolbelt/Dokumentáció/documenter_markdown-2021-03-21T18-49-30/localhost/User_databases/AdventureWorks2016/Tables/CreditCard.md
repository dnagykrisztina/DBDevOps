#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Sales.CreditCard

# ![Tables](../../../../Images/Table32.png) [Sales].[CreditCard]

---

## <a name="#description"></a>MS_Description

Customer credit card information.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 19118 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default | Description |
|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_CreditCard_CreditCardID: CreditCardID](../../../../Images/pkcluster.png)](#indexes) | CreditCardID | int | 4 | NOT NULL | 1 - 1 |  | _Primary key for CreditCard records._ |
|  | CardType | nvarchar(50) | 100 | NOT NULL |  |  | _Credit card name._ |
| [![Indexes AK_CreditCard_CardNumber](../../../../Images/Index.png)](#indexes) | CardNumber | nvarchar(25) | 50 | NOT NULL |  |  | _Credit card number._ |
|  | ExpMonth | tinyint | 1 | NOT NULL |  |  | _Credit card expiration month._ |
|  | ExpYear | smallint | 2 | NOT NULL |  |  | _Credit card expiration year._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_CreditCard_CreditCardID: CreditCardID](../../../../Images/pkcluster.png)](#indexes) | PK_CreditCard_CreditCardID | CreditCardID | YES | _Primary key (clustered) constraint_ |
|  | AK_CreditCard_CardNumber | CardNumber | YES | _Unique nonclustered index._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Sales].[CreditCard]
(
[CreditCardID] [int] NOT NULL IDENTITY(1, 1),
[CardType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CardNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExpMonth] [tinyint] NOT NULL,
[ExpYear] [smallint] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_CreditCard_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[CreditCard] ADD CONSTRAINT [PK_CreditCard_CreditCardID] PRIMARY KEY CLUSTERED  ([CreditCardID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CreditCard_CardNumber] ON [Sales].[CreditCard] ([CardNumber]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Customer credit card information.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Credit card number.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CardNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Credit card name.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CardType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for CreditCard records.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'CreditCardID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Credit card expiration month.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ExpMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Credit card expiration year.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ExpYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'CONSTRAINT', N'DF_CreditCard_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'CONSTRAINT', N'PK_CreditCard_CreditCardID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'INDEX', N'AK_CreditCard_CardNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'CreditCard', 'INDEX', N'PK_CreditCard_CreditCardID'
GO

```


---

## <a name="#uses"></a>Uses

* [Sales](../Security/Schemas/Sales.md)


---

## <a name="#usedby"></a>Used By

* [[Sales].[PersonCreditCard]](PersonCreditCard.md)
* [[Sales].[SalesOrderHeader]](SalesOrderHeader.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

