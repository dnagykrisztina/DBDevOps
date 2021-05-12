###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Person.vStateProvinceCountryRegion


# ![logo](../../../../../Images/view.svg) Person.vStateProvinceCountryRegion

## <a name="#Description"></a>Description
> Joins StateProvince table with CountryRegion table.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation|SQL_Latin1_General_CP1_CI_AS|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Schema Bound|True|
|Created|2017. 10. 27. 14:33:15|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Description
|---|---|---
|[![Cluster Key IX_vStateProvinceCountryRegion](../../../../../Images/Cluster.svg)](#Indexes)|StateProvinceID||
||StateProvinceCode||
||IsOnlyStateProvinceFlag||
||StateProvinceName||
||TerritoryID||
|[![Cluster Key IX_vStateProvinceCountryRegion](../../../../../Images/Cluster.svg)](#Indexes)|CountryRegionCode||
||CountryRegionName||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Cluster Key IX_vStateProvinceCountryRegion](../../../../../Images/Cluster.svg)](#Indexes)|IX_vStateProvinceCountryRegion|StateProvinceID, CountryRegionCode|True||Clustered index on the view vStateProvinceCountryRegion.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Person.vStateProvinceCountryRegion 
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

CREATE UNIQUE CLUSTERED INDEX IX_vStateProvinceCountryRegion
  ON Person.vStateProvinceCountryRegion (StateProvinceID, CountryRegionCode)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index on the view vStateProvinceCountryRegion.', 'SCHEMA', N'Person', 'VIEW', N'vStateProvinceCountryRegion', 'INDEX', N'IX_vStateProvinceCountryRegion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Joins StateProvince table with CountryRegion table.', 'SCHEMA', N'Person', 'VIEW', N'vStateProvinceCountryRegion'
GO
```

## <a name="#DependsOn"></a>Depends On _`5`_
- [Person](../Security/Schemas/Person.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Person.StateProvince](../Tables/Person.StateProvince.md)
- [Person.CountryRegion](../Tables/Person.CountryRegion.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial