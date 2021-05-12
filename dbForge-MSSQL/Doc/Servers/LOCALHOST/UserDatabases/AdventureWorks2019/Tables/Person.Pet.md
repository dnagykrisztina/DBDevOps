###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.Pet


# ![logo](../../../../../Images/table.svg) Person.Pet

## <a name="#Description"></a>Description
> 
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
|Row Count (~)|0|
|Created|2021. 03. 15. 14:53:48|
|Last Modified|2021. 03. 15. 14:57:08|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Pet_ID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Pet_ID](../../../../../Images/Cluster.svg)](#Indexes)|PetID|int|4|10|0|True||||False|False||
||Name|nvarchar|25|0|0|False||||False|False||
||Type|nvarchar|25|0|0|False||||False|False||
||Breed|nvarchar|10|0|0|False||||False|False||
||Color|nvarchar|10|0|0|False||||False|False||
||Age|int|4|10|0|False||||False|False||
|[![Foreign Keys FK_Person_Pet_OwnerID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)|OwnerID|int|4|10|0|False||||False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_Pet_ID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Pet_ID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Pet_ID|PetID|True|||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Person_Pet_OwnerID|BusinessEntityID||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.Pet (
  PetID int NOT NULL,
  Name nvarchar(25) NULL,
  Type nvarchar(25) NULL,
  Breed nvarchar(10) NULL,
  Color nvarchar(10) NULL,
  Age int NULL,
  OwnerID int NULL,
  CONSTRAINT PK_Pet_ID PRIMARY KEY CLUSTERED (PetID)
)
ON [PRIMARY]
GO

ALTER TABLE Person.Pet
  ADD CONSTRAINT FK_Person_Pet_OwnerID FOREIGN KEY (OwnerID) REFERENCES Person.Person (BusinessEntityID)
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [Person.Person](Person.Person.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Person.Person](Person.Person.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial