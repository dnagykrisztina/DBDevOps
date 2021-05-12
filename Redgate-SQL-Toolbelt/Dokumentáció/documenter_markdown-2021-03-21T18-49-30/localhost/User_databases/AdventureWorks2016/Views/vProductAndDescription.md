#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Production.vProductAndDescription

# ![Views](../../../../Images/View32.png) [Production].[vProductAndDescription]

---

## <a name="#description"></a>MS_Description

Product names and descriptions. Product descriptions are provided in multiple languages.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Schema Bound | YES |
| Created | 17:24:52 2017. október 19., csütörtök |
| Last Modified | 17:24:52 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) |
|---|---|---|---|
| [![Cluster Key IX_vProductAndDescription: CultureID\ProductID](../../../../Images/cluster.png)](#indexes) | ProductID | int | 4 |
|  | Name | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
|  | ProductModel | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| [![Cluster Key IX_vProductAndDescription: CultureID\ProductID](../../../../Images/cluster.png)](#indexes) | CultureID | nchar(6) | 12 |
|  | Description | nvarchar(400) | 800 |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Key IX_vProductAndDescription: CultureID\ProductID](../../../../Images/cluster.png)](#indexes) | IX_vProductAndDescription | CultureID, ProductID | YES | _Clustered index on the view vProductAndDescription._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Production].[vProductAndDescription] 
WITH SCHEMABINDING 
AS 
-- View (indexed or standard) to display products and product descriptions by language.
SELECT 
    p.[ProductID] 
    ,p.[Name] 
    ,pm.[Name] AS [ProductModel] 
    ,pmx.[CultureID] 
    ,pd.[Description] 
FROM [Production].[Product] p 
    INNER JOIN [Production].[ProductModel] pm 
    ON p.[ProductModelID] = pm.[ProductModelID] 
    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 
    ON pm.[ProductModelID] = pmx.[ProductModelID] 
    INNER JOIN [Production].[ProductDescription] pd 
    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];
GO
CREATE UNIQUE CLUSTERED INDEX [IX_vProductAndDescription] ON [Production].[vProductAndDescription] ([CultureID], [ProductID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product names and descriptions. Product descriptions are provided in multiple languages.', 'SCHEMA', N'Production', 'VIEW', N'vProductAndDescription', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index on the view vProductAndDescription.', 'SCHEMA', N'Production', 'VIEW', N'vProductAndDescription', 'INDEX', N'IX_vProductAndDescription'
GO

```


---

## <a name="#uses"></a>Uses

* [[Production].[Product]](../Tables/Product.md)
* [[Production].[ProductDescription]](../Tables/ProductDescription.md)
* [[Production].[ProductModel]](../Tables/ProductModel.md)
* [[Production].[ProductModelProductDescriptionCulture]](../Tables/ProductModelProductDescriptionCulture.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Production](../Security/Schemas/Production.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

