###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>dbo.AWBuildVersion


# ![logo](../../../../../Images/table.svg) dbo.AWBuildVersion

## <a name="#Description"></a>Description
> Current version number of the AdventureWorks 2016 sample database. 
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
|Row Count (~)|1|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:06|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_AWBuildVersion_SystemInformationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_AWBuildVersion_SystemInformationID](../../../../../Images/Cluster.svg)](#Indexes)|SystemInformationID|tinyint|1|3|0|True|1 - 1|||False|False|Primary key for AWBuildVersion records.|
||Database Version|nvarchar|25|0|0|True||||False|False|Version number of the database in 9.yy.mm.dd.00 format.|
||VersionDate|datetime|8|23|3|True||||False|False|Date and time the record was last updated.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
|[![Primary Key PK_AWBuildVersion_SystemInformationID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_AWBuildVersion_SystemInformationID](../../../../../Images/Cluster.svg)](#Indexes)|PK_AWBuildVersion_SystemInformationID|SystemInformationID|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE dbo.AWBuildVersion (
  SystemInformationID tinyint IDENTITY,
  [Database Version] nvarchar(25) NOT NULL,
  VersionDate datetime NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_AWBuildVersion_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_AWBuildVersion_SystemInformationID PRIMARY KEY CLUSTERED (SystemInformationID)
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Current version number of the AdventureWorks 2016 sample database. ', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for AWBuildVersion records.', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'COLUMN', N'SystemInformationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Version number of the database in 9.yy.mm.dd.00 format.', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'COLUMN', N'Database Version'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'COLUMN', N'VersionDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'INDEX', N'PK_AWBuildVersion_SystemInformationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'CONSTRAINT', N'PK_AWBuildVersion_SystemInformationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'dbo', 'TABLE', N'AWBuildVersion', 'CONSTRAINT', N'DF_AWBuildVersion_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial