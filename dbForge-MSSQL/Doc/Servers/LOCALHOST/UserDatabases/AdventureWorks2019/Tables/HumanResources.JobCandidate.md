###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>HumanResources.JobCandidate


# ![logo](../../../../../Images/table.svg) HumanResources.JobCandidate

## <a name="#Description"></a>Description
> Résumés submitted to Human Resources by job applicants.
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
|Full Text|PK_JobCandidate_JobCandidateID|
|Compression|NONE|
|Row Count (~)|13|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_JobCandidate_JobCandidateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_JobCandidate_JobCandidateID](../../../../../Images/Cluster.svg)](#Indexes)|JobCandidateID|int|4|10|0|True|1 - 1|||False|False|Primary key for JobCandidate records.|
|[![Foreign Keys FK_JobCandidate_Employee_BusinessEntityID: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_JobCandidate_BusinessEntityID](../../../../../Images/index.svg)](#Indexes)|BusinessEntityID|int|4|10|0|False||||False|False|Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.|
|[![Indexes JobCandidate](../../../../../Images/index.svg)](#Indexes)|Resume|[HumanResources.HRResumeSchemaCollection](../Programmability/Types/XmlSchemaCollection/HumanResources.HRResumeSchemaCollection.md)||0|0|False||||False|False|Résumé in XML format.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_JobCandidate_BusinessEntityID|BusinessEntityID|False||Nonclustered index.|
|[![Primary Key PK_JobCandidate_JobCandidateID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_JobCandidate_JobCandidateID](../../../../../Images/Cluster.svg)](#Indexes)|PK_JobCandidate_JobCandidateID|JobCandidateID|True||Clustered index created by a primary key constraint.|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_JobCandidate_Employee_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing Employee.EmployeeID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE HumanResources.JobCandidate (
  JobCandidateID int IDENTITY,
  BusinessEntityID int NULL,
  Resume xml (CONTENT HumanResources.HRResumeSchemaCollection) NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_JobCandidate_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_JobCandidate_JobCandidateID PRIMARY KEY CLUSTERED (JobCandidateID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX IX_JobCandidate_BusinessEntityID
  ON HumanResources.JobCandidate (BusinessEntityID)
  ON [PRIMARY]
GO

ALTER TABLE HumanResources.JobCandidate
  ADD CONSTRAINT FK_JobCandidate_Employee_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'FK_JobCandidate_Employee_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Résumés submitted to Human Resources by job applicants.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for JobCandidate records.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Résumé in XML format.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'Resume'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'IX_JobCandidate_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'PK_JobCandidate_JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'PK_JobCandidate_JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'DF_JobCandidate_ModifiedDate'
GO

CREATE FULLTEXT INDEX
  ON HumanResources.JobCandidate(Resume LANGUAGE 1033)
  KEY INDEX PK_JobCandidate_JobCandidateID
  ON AW2016FullTextCatalog
  WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
```

## <a name="#DependsOn"></a>Depends On _`4`_
- [HumanResources](../Security/Schemas/HumanResources.md)
- [HumanResources.Employee](HumanResources.Employee.md)
- [AW2016FullTextCatalog](../Storage/FullTextCatalogs/AW2016FullTextCatalog.md)
- [HumanResources.HRResumeSchemaCollection](../Programmability/Types/XmlSchemaCollection/HumanResources.HRResumeSchemaCollection.md)


## <a name="#UsedBy"></a>Used By _`4`_
- [HumanResources.vJobCandidate](../Views/HumanResources.vJobCandidate.md)
- [HumanResources.vJobCandidateEducation](../Views/HumanResources.vJobCandidateEducation.md)
- [HumanResources.vJobCandidateEmployment](../Views/HumanResources.vJobCandidateEmployment.md)
- [dbo.uspSearchCandidateResumes](../Programmability/Procedures/dbo.uspSearchCandidateResumes.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial