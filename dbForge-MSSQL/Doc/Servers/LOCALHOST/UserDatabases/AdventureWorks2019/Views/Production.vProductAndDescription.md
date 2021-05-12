###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Views](Views.md)>Production.vProductAndDescription


# ![logo](../../../../../Images/view.svg) Production.vProductAndDescription

## <a name="#Description"></a>Description
> Product names and descriptions. Product descriptions are provided in multiple languages.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation|SQL_Latin1_General_CP1_CI_AS|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Schema Bound|True|
|Created|2017. 10. 27. 14:33:14|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Description
|---|---|---
|[![Cluster Key IX_vProductAndDescription](../../../../../Images/Cluster.svg)](#Indexes)|ProductID||
||Name||
||ProductModel||
|[![Cluster Key IX_vProductAndDescription](../../../../../Images/Cluster.svg)](#Indexes)|CultureID||
||Description||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Cluster Key IX_vProductAndDescription](../../../../../Images/Cluster.svg)](#Indexes)|IX_vProductAndDescription|CultureID, ProductID|True||Clustered index on the view vProductAndDescription.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE OR ALTER VIEW Production.vProductAndDescription 
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

CREATE UNIQUE CLUSTERED INDEX IX_vProductAndDescription
  ON Production.vProductAndDescription (CultureID, ProductID)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index on the view vProductAndDescription.', 'SCHEMA', N'Production', 'VIEW', N'vProductAndDescription', 'INDEX', N'IX_vProductAndDescription'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product names and descriptions. Product descriptions are provided in multiple languages.', 'SCHEMA', N'Production', 'VIEW', N'vProductAndDescription'
GO
```

## <a name="#DependsOn"></a>Depends On _`6`_
- [Production](../Security/Schemas/Production.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Production.ProductModel](../Tables/Production.ProductModel.md)
- [Production.Product](../Tables/Production.Product.md)
- [Production.ProductModelProductDescriptionCulture](../Tables/Production.ProductModelProductDescriptionCulture.md)
- [Production.ProductDescription](../Tables/Production.ProductDescription.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial