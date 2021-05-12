###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Storage](../Storage.md)>[Full-Text Catalogs](FullTextCatalogs.md)>AW2016FullTextCatalog


# ![logo](../../../../../../Images/FullTextCatalog.svg) AW2016FullTextCatalog


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|
|Default Catalog|True|
|Accent Sensitivity|True|
|File Group||
|Path||


## <a name="#Tables"></a>Assigned Tables _`3`_
- [HumanResources.JobCandidate](../../Tables/HumanResources.JobCandidate.md)
- [Production.Document](../../Tables/Production.Document.md)
- [Production.ProductReview](../../Tables/Production.ProductReview.md)


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE FULLTEXT CATALOG AW2016FullTextCatalog
  AS DEFAULT
  AUTHORIZATION dbo
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`3`_
- [HumanResources.JobCandidate](../../Tables/HumanResources.JobCandidate.md)
- [Production.Document](../../Tables/Production.Document.md)
- [Production.ProductReview](../../Tables/Production.ProductReview.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial