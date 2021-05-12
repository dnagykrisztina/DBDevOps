#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Person.vStateProvinceCountryRegion

# ![Views](../../../../Images/View32.png) [Person].[vStateProvinceCountryRegion]

---

## <a name="#description"></a>MS_Description

Joins StateProvince table with CountryRegion table.

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
| [![Cluster Key IX_vStateProvinceCountryRegion: StateProvinceID\CountryRegionCode](../../../../Images/cluster.png)](#indexes) | StateProvinceID | int | 4 |
|  | StateProvinceCode | nchar(3) | 6 |
|  | IsOnlyStateProvinceFlag | [[dbo].[Flag]](../Programmability/Types/User-Defined_Data_Types/Flag.md) | 1 |
|  | StateProvinceName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
|  | TerritoryID | int | 4 |
| [![Cluster Key IX_vStateProvinceCountryRegion: StateProvinceID\CountryRegionCode](../../../../Images/cluster.png)](#indexes) | CountryRegionCode | nvarchar(3) | 6 |
|  | CountryRegionName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Key IX_vStateProvinceCountryRegion: StateProvinceID\CountryRegionCode](../../../../Images/cluster.png)](#indexes) | IX_vStateProvinceCountryRegion | StateProvinceID, CountryRegionCode | YES | _Clustered index on the view vStateProvinceCountryRegion._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Person].[vStateProvinceCountryRegion] 
WITH SCHEMABINDING 
AS 
SELECT 
    sp.[StateProvinceID] 
    ,sp.[StateProvinceCode] 
    ,sp.[IsOnlyStateProvinceFlag] 
    ,sp.[Name] AS [StateProvinceName] 
    ,sp.[TerritoryID] 
    ,cr.[CountryRegionCode] 
    ,cr.[Name] AS [CountryRegionName]
FROM [Person].[StateProvince] sp 
    INNER JOIN [Person].[CountryRegion] cr 
    ON sp.[CountryRegionCode] = cr.[CountryRegionCode];
GO
CREATE UNIQUE CLUSTERED INDEX [IX_vStateProvinceCountryRegion] ON [Person].[vStateProvinceCountryRegion] ([StateProvinceID], [CountryRegionCode]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Joins StateProvince table with CountryRegion table.', 'SCHEMA', N'Person', 'VIEW', N'vStateProvinceCountryRegion', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index on the view vStateProvinceCountryRegion.', 'SCHEMA', N'Person', 'VIEW', N'vStateProvinceCountryRegion', 'INDEX', N'IX_vStateProvinceCountryRegion'
GO

```


---

## <a name="#uses"></a>Uses

* [[Person].[CountryRegion]](../Tables/CountryRegion.md)
* [[Person].[StateProvince]](../Tables/StateProvince.md)
* [[dbo].[Flag]](../Programmability/Types/User-Defined_Data_Types/Flag.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Person](../Security/Schemas/Person.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

