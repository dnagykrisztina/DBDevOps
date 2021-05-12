###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.Document


# ![logo](../../../../../Images/table.svg) Production.Document

## <a name="#Description"></a>Description
> Product maintenance documents.
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
|Full Text|PK_Document_DocumentNode|
|Compression|NONE|
|Row Count (~)|13|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Document_DocumentNode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Document_DocumentNode](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes AK_Document_DocumentLevel_DocumentNode](../../../../../Images/index.svg)](#Indexes)|DocumentNode|hierarchyid|892|0|0|True||||False|False|Primary key for Document records.|
|[![Indexes AK_Document_DocumentLevel_DocumentNode](../../../../../Images/index.svg)](#Indexes)|DocumentLevel|smallint|2|5|0|False||||True|False|Depth in the document hierarchy.|
||Title|nvarchar|50|0|0|True||||False|False|Title of the document.|
|[![Foreign Keys FK_Document_Employee_Owner: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)|Owner|int|4|10|0|True||||False|False|Employee who controls the document.  Foreign key to Employee.BusinessEntityID|
||FolderFlag|bit|1|1|0|True|||(0)|False|False|0 = This is a folder, 1 = This is a document.|
|[![Indexes IX_Document_FileName_Revision](../../../../../Images/index.svg)](#Indexes)|FileName|nvarchar|400|0|0|True||||False|False|File name of the document|
||FileExtension|nvarchar|8|0|0|True||||False|False|File extension indicating the document type. For example, .doc or .txt.|
|[![Indexes IX_Document_FileName_Revision](../../../../../Images/index.svg)](#Indexes)|Revision|nchar|5|0|0|True||||False|False|Revision number of the document. |
||ChangeNumber|int|4|10|0|True|||(0)|False|False|Engineering change approval number.|
|[![Check Constraint CK_Document_Status](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Status|tinyint|1|3|0|True||||False|False|1 = Pending approval, 2 = Approved, 3 = Obsolete|
|[![Indexes Document](../../../../../Images/index.svg)](#Indexes)|DocumentSummary|nvarchar||0|0|False||||False|False|Document abstract.|
|[![Indexes Document](../../../../../Images/index.svg)](#Indexes)|Document|varbinary||0|0|False||||False|False|Complete document.|
|[![Indexes AK_Document_rowguidUQ__Document__F73921F7C5112C2E](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Required for FileStream.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|DocumentLevel|([DocumentNode].[GetLevel]())|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Document_DocumentLevel_DocumentNode|DocumentLevel, DocumentNode|True||Unique nonclustered index.|
||AK_Document_rowguid|rowguid|True||Unique nonclustered index. Used to support FileStream.|
||IX_Document_FileName_Revision|FileName, Revision|False||Unique nonclustered index.|
|[![Primary Key PK_Document_DocumentNode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Document_DocumentNode](../../../../../Images/Cluster.svg)](#Indexes)|PK_Document_DocumentNode|DocumentNode|True||Clustered index created by a primary key constraint.|
|[![Primary Key UQ__Document__F73921F7C5112C2E](../../../../../Images/primarykey.svg)](#Indexes)|UQ__Document__F73921F7C5112C2E|rowguid|True|||

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Document_Status|Status|([Status]>=(1) AND [Status]<=(3))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Document_Employee_Owner|BusinessEntityID|Foreign key constraint referencing Employee.BusinessEntityID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.Document (
  DocumentNode hierarchyid NOT NULL,
  DocumentLevel AS ([DocumentNode].[GetLevel]()),
  Title nvarchar(50) NOT NULL,
  Owner int NOT NULL,
  FolderFlag bit NOT NULL CONSTRAINT DF_Document_FolderFlag DEFAULT (0),
  FileName nvarchar(400) NOT NULL,
  FileExtension nvarchar(8) NOT NULL,
  Revision nchar(5) NOT NULL,
  ChangeNumber int NOT NULL CONSTRAINT DF_Document_ChangeNumber DEFAULT (0),
  Status tinyint NOT NULL,
  DocumentSummary nvarchar(max) NULL,
  Document varbinary(max) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Document_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Document_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Document_DocumentNode PRIMARY KEY CLUSTERED (DocumentNode),
  UNIQUE (rowguid),
  CONSTRAINT CK_Document_Status CHECK ([Status]>=(1) AND [Status]<=(3))
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Document_DocumentLevel_DocumentNode
  ON Production.Document (DocumentLevel, DocumentNode)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Document_rowguid
  ON Production.Document (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_Document_FileName_Revision
  ON Production.Document (FileName, Revision)
  ON [PRIMARY]
GO

ALTER TABLE Production.Document
  ADD CONSTRAINT FK_Document_Employee_Owner FOREIGN KEY (Owner) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.BusinessEntityID.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'FK_Document_Employee_Owner'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product maintenance documents.', 'SCHEMA', N'Production', 'TABLE', N'Document'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Document records.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Depth in the document hierarchy.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'DocumentLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Title of the document.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'Title'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee who controls the document.  Foreign key to Employee.BusinessEntityID', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'Owner'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = This is a folder, 1 = This is a document.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'FolderFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'File name of the document', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'FileName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'File extension indicating the document type. For example, .doc or .txt.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'FileExtension'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Revision number of the document. ', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'Revision'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Engineering change approval number.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'ChangeNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1 = Pending approval, 2 = Approved, 3 = Obsolete', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Document abstract.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'DocumentSummary'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Complete document.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'Document'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Required for FileStream.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'INDEX', N'AK_Document_DocumentLevel_DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support FileStream.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'INDEX', N'AK_Document_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'INDEX', N'IX_Document_FileName_Revision'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Document', 'INDEX', N'PK_Document_DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'PK_Document_DocumentNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Status] BETWEEN (1) AND (3)', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'CK_Document_Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'DF_Document_ChangeNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'DF_Document_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'Document', 'CONSTRAINT', N'DF_Document_rowguid'
GO

CREATE FULLTEXT INDEX
  ON Production.Document(DocumentSummary LANGUAGE 1033, Document TYPE COLUMN FileExtension LANGUAGE 1033)
  KEY INDEX PK_Document_DocumentNode
  ON AW2016FullTextCatalog
  WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [HumanResources.Employee](HumanResources.Employee.md)
- [AW2016FullTextCatalog](../Storage/FullTextCatalogs/AW2016FullTextCatalog.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductDocument](Production.ProductDocument.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial