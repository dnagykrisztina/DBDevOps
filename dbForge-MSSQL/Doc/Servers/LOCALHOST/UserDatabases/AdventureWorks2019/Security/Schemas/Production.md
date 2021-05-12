###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Security](../Security.md)>[Schemas](Schemas.md)>Production


# ![logo](../../../../../../Images/schema.svg) Production

## <a name="#Description"></a>Description
> Contains objects related to products, inventory, and manufacturing.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SCHEMA Production AUTHORIZATION dbo
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to products, inventory, and manufacturing.', 'SCHEMA', N'Production'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`30`_
- [Production.BillOfMaterials](../../Tables/Production.BillOfMaterials.md)
- [Production.Culture](../../Tables/Production.Culture.md)
- [Production.Document](../../Tables/Production.Document.md)
- [Production.Illustration](../../Tables/Production.Illustration.md)
- [Production.Location](../../Tables/Production.Location.md)
- [Production.Product](../../Tables/Production.Product.md)
- [Production.ProductCategory](../../Tables/Production.ProductCategory.md)
- [Production.ProductCostHistory](../../Tables/Production.ProductCostHistory.md)
- [Production.ProductDescription](../../Tables/Production.ProductDescription.md)
- [Production.ProductDocument](../../Tables/Production.ProductDocument.md)
- [Production.ProductInventory](../../Tables/Production.ProductInventory.md)
- [Production.ProductListPriceHistory](../../Tables/Production.ProductListPriceHistory.md)
- [Production.ProductModel](../../Tables/Production.ProductModel.md)
- [Production.ProductModelIllustration](../../Tables/Production.ProductModelIllustration.md)
- [Production.ProductModelProductDescriptionCulture](../../Tables/Production.ProductModelProductDescriptionCulture.md)
- [Production.ProductPhoto](../../Tables/Production.ProductPhoto.md)
- [Production.ProductProductPhoto](../../Tables/Production.ProductProductPhoto.md)
- [Production.ProductReview](../../Tables/Production.ProductReview.md)
- [Production.ProductSubcategory](../../Tables/Production.ProductSubcategory.md)
- [Production.ScrapReason](../../Tables/Production.ScrapReason.md)
- [Production.TransactionHistory](../../Tables/Production.TransactionHistory.md)
- [Production.TransactionHistoryArchive](../../Tables/Production.TransactionHistoryArchive.md)
- [Production.UnitMeasure](../../Tables/Production.UnitMeasure.md)
- [Production.WorkOrder](../../Tables/Production.WorkOrder.md)
- [Production.WorkOrderRouting](../../Tables/Production.WorkOrderRouting.md)
- [Production.vProductAndDescription](../../Views/Production.vProductAndDescription.md)
- [Production.vProductModelCatalogDescription](../../Views/Production.vProductModelCatalogDescription.md)
- [Production.vProductModelInstructions](../../Views/Production.vProductModelInstructions.md)
- [Production.ManuInstructionsSchemaCollection](../../Programmability/Types/XmlSchemaCollection/Production.ManuInstructionsSchemaCollection.md)
- [Production.ProductDescriptionSchemaCollection](../../Programmability/Types/XmlSchemaCollection/Production.ProductDescriptionSchemaCollection.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial