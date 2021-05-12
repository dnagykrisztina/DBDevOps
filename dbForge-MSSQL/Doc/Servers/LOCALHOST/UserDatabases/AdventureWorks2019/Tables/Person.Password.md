###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.Password


# ![logo](../../../../../Images/table.svg) Person.Password

## <a name="#Description"></a>Description
> One way hashed authentication information
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
|Row Count (~)|19972|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Password_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_Password_Person_BusinessEntityID: Person.Person](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_Password_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False||
||PasswordHash|varchar|128|0|0|True||||False|False|Password for the e-mail account.|
||PasswordSalt|varchar|10|0|0|True||||False|False|Random value concatenated with the password string before the password is hashed.|
||rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_Password_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Password_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Password_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Password_Person_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Person.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.Password (
  BusinessEntityID int NOT NULL,
  PasswordHash varchar(128) NOT NULL,
  PasswordSalt varchar(10) NOT NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Password_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Password_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Password_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID)
)
ON [PRIMARY]
GO

ALTER TABLE Person.Password
  ADD CONSTRAINT FK_Password_Person_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.Person (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'CONSTRAINT', N'FK_Password_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'One way hashed authentication information', 'SCHEMA', N'Person', 'TABLE', N'Password'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Password for the e-mail account.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'COLUMN', N'PasswordHash'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Random value concatenated with the password string before the password is hashed.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'COLUMN', N'PasswordSalt'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Password', 'INDEX', N'PK_Password_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Password', 'CONSTRAINT', N'PK_Password_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Password', 'CONSTRAINT', N'DF_Password_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Password', 'CONSTRAINT', N'DF_Password_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [Person.Person](Person.Person.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial