#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > Person.Pet

# ![Tables](../../../../Images/Table32.png) [Person].[Pet]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 17:29:01 2021. március 21., vasárnap |
| Last Modified | 17:29:01 2021. március 21., vasárnap |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_Pet: PetID](../../../../Images/pkcluster.png)](#indexes) | PetID | int | 4 | NOT NULL |
|  | Name | nvarchar(25) | 50 | NULL allowed |
|  | Color | nvarchar(15) | 30 | NULL allowed |
|  | Type | nvarchar(15) | 30 | NULL allowed |
|  | Breed | nvarchar(25) | 50 | NULL allowed |
| [![Foreign Keys FK_Pet_OwnerID: [Person].[Person].OwnerID](../../../../Images/fk.png)](#foreignkeys) | OwnerID | int | 4 | NOT NULL |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_Pet: PetID](../../../../Images/pkcluster.png)](#indexes) | PK_Pet | PetID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Pet_OwnerID | OwnerID->[[Person].[Person].[BusinessEntityID]](Person.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Person].[Pet]
(
[PetID] [int] NOT NULL,
[Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Breed] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Pet] ADD CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED  ([PetID]) ON [PRIMARY]
GO
ALTER TABLE [Person].[Pet] ADD CONSTRAINT [FK_Pet_OwnerID] FOREIGN KEY ([OwnerID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Person].[Person]](Person.md)
* [Person](../Security/Schemas/Person.md)


---

## <a name="#usedby"></a>Used By

* [[Person].[Person]](Person.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

