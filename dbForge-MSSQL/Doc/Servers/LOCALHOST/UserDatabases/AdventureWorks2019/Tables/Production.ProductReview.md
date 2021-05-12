###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.ProductReview


# ![logo](../../../../../Images/table.svg) Production.ProductReview

## <a name="#Description"></a>Description
> Customer reviews of products they have purchased.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation||
|File Group||
|Filestream File Group||
|Is Partitioned|False|
|Partitioned Column||
|Partition Scheme||
|File Groups||
|Filestream Partition Scheme||
|Filestream File Groups||
|Heap|False|
|Full Text Catalog|[AW2016FullTextCatalog](../Storage/FullTextCatalogs/AW2016FullTextCatalog.md)|
|Full Text|PK_ProductReview_ProductReviewID|
|Compression|NONE|
|Row Count (~)|4|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_ProductReview_ProductReviewID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductReview_ProductReviewID](../../../../../Images/Cluster.svg)](#Indexes)|ProductReviewID|int|4|10|0|True|1 - 1|||False|False|Primary key for ProductReview records.|
|[![Foreign Keys FK_ProductReview_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_ProductReview_ProductID_Name](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Indexes IX_ProductReview_ProductID_Name](../../../../../Images/index.svg)](#Indexes)|ReviewerName|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Name of the reviewer.|
||ReviewDate|datetime|8|23|3|True|||(getdate())|False|False|Date review was submitted.|
||EmailAddress|nvarchar|50|0|0|True||||False|False|Reviewer's e-mail address.|
|[![Check Constraint CK_ProductReview_Rating](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Rating|int|4|10|0|True||||False|False|Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.|
|[![Indexes ProductReview](../../../../../Images/index.svg)](#Indexes)|Comments|nvarchar|3850|0|0|False||||False|False|Reviewer's comments|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_ProductReview_ProductID_Name|ProductID, ReviewerName|False||Nonclustered index.|
|[![Primary Key PK_ProductReview_ProductReviewID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_ProductReview_ProductReviewID](../../../../../Images/Cluster.svg)](#Indexes)|PK_ProductReview_ProductReviewID|ProductReviewID|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_ProductReview_Rating|Rating|([Rating]>=(1) AND [Rating]<=(5))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_ProductReview_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.ProductReview (
  ProductReviewID int IDENTITY,
  ProductID int NOT NULL,
  ReviewerName dbo.Name NOT NULL,
  ReviewDate datetime NOT NULL CONSTRAINT DF_ProductReview_ReviewDate DEFAULT (getdate()),
  EmailAddress nvarchar(50) NOT NULL,
  Rating int NOT NULL,
  Comments nvarchar(3850) NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_ProductReview_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_ProductReview_ProductReviewID PRIMARY KEY CLUSTERED (ProductReviewID),
  CONSTRAINT CK_ProductReview_Rating CHECK ([Rating]>=(1) AND [Rating]<=(5))
)
ON [PRIMARY]
GO

CREATE INDEX IX_ProductReview_ProductID_Name
  ON Production.ProductReview (ProductID, ReviewerName)
  INCLUDE (Comments)
  ON [PRIMARY]
GO

ALTER TABLE Production.ProductReview
  ADD CONSTRAINT FK_ProductReview_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'CONSTRAINT', N'FK_ProductReview_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer reviews of products they have purchased.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductReview records.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ProductReviewID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the reviewer.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ReviewerName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date review was submitted.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ReviewDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reviewer''s e-mail address.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'Rating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reviewer''s comments', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'Comments'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'INDEX', N'IX_ProductReview_ProductID_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'INDEX', N'PK_ProductReview_ProductReviewID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'CONSTRAINT', N'PK_ProductReview_ProductReviewID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Rating] BETWEEN (1) AND (5)', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'CONSTRAINT', N'CK_ProductReview_Rating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'CONSTRAINT', N'DF_ProductReview_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'CONSTRAINT', N'DF_ProductReview_ReviewDate'
GO

CREATE FULLTEXT INDEX
  ON Production.ProductReview(Comments LANGUAGE 1033)
  KEY INDEX PK_ProductReview_ProductReviewID
  ON AW2016FullTextCatalog
  WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)
- [AW2016FullTextCatalog](../Storage/FullTextCatalogs/AW2016FullTextCatalog.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial