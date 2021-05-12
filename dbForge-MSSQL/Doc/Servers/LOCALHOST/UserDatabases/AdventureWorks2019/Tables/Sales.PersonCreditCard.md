###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.PersonCreditCard


# ![logo](../../../../../Images/table.svg) Sales.PersonCreditCard

## <a name="#Description"></a>Description
> Cross-reference table mapping people to their credit card information in the CreditCard table. 
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
|Full Text Catalog||
|Full Text||
|Compression|NONE|
|Row Count (~)|19118|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_PersonCreditCard_Person_BusinessEntityID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Business entity identification number. Foreign key to Person.BusinessEntityID.|
|[![Primary Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_PersonCreditCard_CreditCard_CreditCardID: Sales.CreditCard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/Cluster.svg)](#Indexes)|CreditCardID|int|4|10|0|True||||False|False|Credit card identification number. Foreign key to CreditCard.CreditCardID.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PersonCreditCard_BusinessEntityID_CreditCardID](../../../../../Images/Cluster.svg)](#Indexes)|PK_PersonCreditCard_BusinessEntityID_CreditCardID|BusinessEntityID, CreditCardID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_PersonCreditCard_CreditCard_CreditCardID|CreditCardID|Foreign key constraint referencing CreditCard.CreditCardID.|
|FK_PersonCreditCard_Person_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.PersonCreditCard (
  BusinessEntityID int NOT NULL,
  CreditCardID int NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_PersonCreditCard_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_PersonCreditCard_BusinessEntityID_CreditCardID PRIMARY KEY CLUSTERED (BusinessEntityID, CreditCardID)
)
ON [PRIMARY]
GO

ALTER TABLE Sales.PersonCreditCard
  ADD CONSTRAINT FK_PersonCreditCard_CreditCard_CreditCardID FOREIGN KEY (CreditCardID) REFERENCES Sales.CreditCard (CreditCardID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CreditCard.CreditCardID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'CONSTRAINT', N'FK_PersonCreditCard_CreditCard_CreditCardID'
GO

ALTER TABLE Sales.PersonCreditCard
  ADD CONSTRAINT FK_PersonCreditCard_Person_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'CONSTRAINT', N'FK_PersonCreditCard_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping people to their credit card information in the CreditCard table. ', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Business entity identification number. Foreign key to Person.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card identification number. Foreign key to CreditCard.CreditCardID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'INDEX', N'PK_PersonCreditCard_BusinessEntityID_CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'CONSTRAINT', N'PK_PersonCreditCard_BusinessEntityID_CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'CONSTRAINT', N'DF_PersonCreditCard_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.Person](Person.Person.md)
- [Sales.CreditCard](Sales.CreditCard.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial