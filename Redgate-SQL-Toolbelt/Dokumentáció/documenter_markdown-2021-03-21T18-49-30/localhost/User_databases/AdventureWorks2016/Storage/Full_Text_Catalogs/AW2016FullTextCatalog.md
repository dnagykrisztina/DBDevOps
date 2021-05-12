#### 

[Project](../../../../../index.md) > [localhost](../../../../index.md) > [User databases](../../../index.md) > [AdventureWorks2016](../../index.md) > [Storage](../index.md) > [Full Text Catalogs](Full_Text_Catalogs.md) > AW2016FullTextCatalog

# ![Full Text Catalogs](../../../../../Images/FullTextCatalog32.png) AW2016FullTextCatalog

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../../Security/Users/dbo.md) |
| Default | YES |
| Accent Sensitive | YES |


---

## <a name="#tables"></a>Tables

* [JobCandidate](../../Tables/JobCandidate.md)
* [Document](../../Tables/Document.md)
* [ProductReview](../../Tables/ProductReview.md)


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE FULLTEXT CATALOG [AW2016FullTextCatalog]
WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
AUTHORIZATION [dbo]
GO
CREATE FULLTEXT INDEX ON [HumanResources].[JobCandidate] KEY INDEX [PK_JobCandidate_JobCandidateID] ON [AW2016FullTextCatalog]
GO
CREATE FULLTEXT INDEX ON [Production].[Document] KEY INDEX [PK_Document_DocumentNode] ON [AW2016FullTextCatalog]
GO
CREATE FULLTEXT INDEX ON [Production].[ProductReview] KEY INDEX [PK_ProductReview_ProductReviewID] ON [AW2016FullTextCatalog]
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[JobCandidate]](../../Tables/JobCandidate.md)
* [[Production].[Document]](../../Tables/Document.md)
* [[Production].[ProductReview]](../../Tables/ProductReview.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

